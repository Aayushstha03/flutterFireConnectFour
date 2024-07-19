import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;
  String? _gameId;
  String? _playerId;

  GameBoard get gameBoard => _gameBoard;
  int get currentPlayer => _currentPlayer;

  Color playerOneColor = Colors.red;
  Color playerTwoColor = Colors.yellow;

  void setColors(Color playerOne, Color playerTwo) {
    playerOneColor = playerOne;
    playerTwoColor = playerTwo;
    notifyListeners();
  }

  Color getPlayerOneColor() {
    return playerOneColor;
  }

  Color getPlayerTwoColor() {
    return playerTwoColor;
  }

  void initializeGame(String gameId, String playerId) {
    _gameId = gameId;
    _playerId = playerId;

    FirebaseFirestore.instance
        .collection('games')
        .doc(gameId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        var data = snapshot.data()!;
        print("Retrieved data from Firestore: $data\n\n");
        var flatBoard = List<int>.from(data['board']);
        _gameBoard.board = List<List<int>>.generate(GameBoard.rows, (i) {
          return flatBoard.sublist(
              i * GameBoard.columns, (i + 1) * GameBoard.columns);
        });
        _currentPlayer = (data['currentTurn'] == 'player1') ? 1 : 2;
        print('In game Init function currentPlayer: $_currentPlayer\n\n');
        notifyListeners();
      }
    });
  }

  Future<void> whenDropedDisc(int column, BuildContext context) async {
    if (_gameId == null ||
        (_currentPlayer == 1 && _playerId != 'player1') ||
        (_currentPlayer == 2 && _playerId != 'player2')) return;

    if (_gameBoard.dropDisc(column, _currentPlayer)) {
      bool hasWon = _gameBoard.checkForWin(_currentPlayer);

      var flattenedBoard = _gameBoard.board.expand((row) => row).toList();
      print("Sending data to Firestore: $flattenedBoard\n\n");

      await FirebaseFirestore.instance.collection('games').doc(_gameId).update({
        'board': flattenedBoard,
        'currentTurn':
            hasWon ? null : (_currentPlayer == 1 ? 'player2' : 'player1'),
        'status': hasWon ? 'completed' : 'ongoing',
      });

      if (hasWon) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Player $_currentPlayer wins!'),
              actions: [
                TextButton(
                  onPressed: () {
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
      notifyListeners();
    }
  }

  void resetGame() {
    _gameBoard = GameBoard();
    _currentPlayer = 1;
    var flattenedBoard = _gameBoard.board.expand((row) => row).toList();
    print("Resetting game and sending data to Firestore: $flattenedBoard");

    if (_gameId != null) {
      FirebaseFirestore.instance.collection('games').doc(_gameId).set({
        'board': flattenedBoard,
        'currentTurn': 'player1',
        'status': 'ongoing',
      });
    }
    notifyListeners();
  }
}
