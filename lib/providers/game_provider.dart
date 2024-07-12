import 'package:connect4/multiplayer/firestore_controller.dart';
import 'package:flutter/material.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;
  final FirestoreService _firestoreService;
  String? _gameId;

  GameProvider(this._firestoreService);

  GameBoard get gameBoard => _gameBoard;
  int get currentPlayer => _currentPlayer;
  String? get gameId => _gameId;

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

  Future<void> createGame() async {
    _gameId = await _firestoreService.createGame();
    _subscribeToGame();
  }

  Future<void> joinGame(String gameId) async {
    _gameId = gameId;
    _subscribeToGame();
  }

  void _subscribeToGame() {
    if (_gameId != null) {
      _firestoreService.getGameStream(_gameId!).listen((snapshot) {
        var data = snapshot.data() as Map<String, dynamic>;
        _gameBoard = GameBoard.fromFirestore(data['board']);
        _currentPlayer = data['currentPlayer'];
        notifyListeners();
      });
    }
  }

  Future<void> whenDropedDisc(int column, BuildContext context) async {
    if (_gameId != null) {
      await _firestoreService.makeMove(_gameId!, column, _currentPlayer);
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

  Future<void> resetGame() async {
    if (_gameId != null) {
      await _firestoreService.resetGame(_gameId!);
    }
    _gameBoard = GameBoard();
    _currentPlayer = 1;
    notifyListeners();
  }
}
