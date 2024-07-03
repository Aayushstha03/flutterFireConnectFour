import 'package:flutter/material.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;

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

  void dropDisc(int column, BuildContext context) {
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
}
