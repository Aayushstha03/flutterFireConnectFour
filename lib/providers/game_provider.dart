import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  final FirebaseFirestore _firestore;

  GameProvider(this._firestore);

  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;

  GameBoard get gameBoard => _gameBoard;
  int get currentPlayer => _currentPlayer;

  Color playerOneColor = Colors.red;
  Color playerTwoColor = Colors.yellow;

  String? _gameId;
  String? get gameId => _gameId;

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

  void whenDropedDisc(int column, BuildContext context) {
    if (_gameBoard.dropDisc(column, _currentPlayer)) {
      // Check for win after dropping the disc
      bool hasWon = _gameBoard.checkForWin(_currentPlayer);
      if (hasWon) {
        // Show dialog if win
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
        // Change turn if no win
        _currentPlayer = _currentPlayer == 1 ? 2 : 1;
      }
      notifyListeners();
    }
  }

  void resetGame() {
    _gameBoard = GameBoard();
    _currentPlayer = 1;
    notifyListeners();
  }

  Future<void> initializeMultiplayerGame() async {
    final gameCollection = _firestore.collection('games');

    // Check if there's an existing game to join
    final availableGame =
        await gameCollection.where('player2', isEqualTo: null).limit(1).get();

    if (availableGame.docs.isNotEmpty) {
      // Join the existing game
      final gameDoc = availableGame.docs.first;
      _gameId = gameDoc.id;
      await gameCollection.doc(_gameId).update({'player2': 'player2_id'});
      _currentPlayer = 2; // Second player
    } else {
      // Create a new game
      final newGame = await gameCollection.add({
        'player1': 'player1_id',
        'player2': null,
        'board': _gameBoard.board,
        'currentPlayer': _currentPlayer,
      });
      _gameId = newGame.id;
      _currentPlayer = 1; // First player
    }

    // Listen to game updates
    gameCollection.doc(_gameId).snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          _gameBoard = GameBoard.fromFirestore(data['board']);
          _currentPlayer = data['currentPlayer'];
          notifyListeners();
        }
      }
    });
  }

  Future<void> updateGameState() async {
    if (_gameId != null) {
      await _firestore.collection('games').doc(_gameId).update({
        'board': _gameBoard.toFirestore(),
        'currentPlayer': _currentPlayer,
      });
    }
  }
}
