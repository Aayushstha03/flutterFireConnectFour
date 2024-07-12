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
        _gameBoard.board = List<List<int>>.generate(GameBoard.rows, (i) {
          return List<int>.generate(GameBoard.columns, (j) {
            return data['board'][i * GameBoard.columns + j];
          });
        });
        _currentPlayer = data['currentTurn'] == 'player1' ? 1 : 2;
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

      await FirebaseFirestore.instance.collection('games').doc(_gameId).update({
        'board': _gameBoard.board.expand((row) => row).toList(),
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
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          },
        );
      } else {
        _currentPlayer = _currentPlayer == 1 ? 2 : 1;
      }

      notifyListeners();
    }
  }

  void resetGame() {
    _gameBoard = GameBoard();
    _currentPlayer = 1;
    if (_gameId != null) {
      FirebaseFirestore.instance.collection('games').doc(_gameId).set({
        'board': _gameBoard.board.expand((row) => row).toList(),
        'currentTurn': 'player1',
        'status': 'ongoing',
      });
    }
    notifyListeners();
  }
}
