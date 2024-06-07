import 'package:flutter/material.dart';
import '../models/game_board.dart';

class GameProvider with ChangeNotifier {
  GameBoard _gameBoard = GameBoard();
  int _currentPlayer = 1;

  GameBoard get gameBoard => _gameBoard;
  int get currentPlayer => _currentPlayer;

  void dropDisc(int column) {
    if (_gameBoard.dropDisc(column, _currentPlayer)) {
      _currentPlayer = _currentPlayer == 1 ? 2 : 1;
      notifyListeners();
    }
  }

  void resetGame() {
    _gameBoard = GameBoard();
    _currentPlayer = 1;
    notifyListeners();
  }
}
