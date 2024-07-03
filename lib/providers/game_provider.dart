import 'package:flutter/material.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;

  GameBoard get gameBoard => _gameBoard;
  int get currentPlayer => _currentPlayer;

  // In your GameProvider class
  void dropDisc(int column) {
    if (_gameBoard.dropDisc(column, _currentPlayer)) {
      // Check for win after dropping the disc
      bool hasWon = _gameBoard.checkForWin(_currentPlayer);
      if (hasWon) {
        // Handle win condition (e.g., update the state, notify listeners)
        // print("Player $_currentPlayer has won!"); // Placeholder action
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
