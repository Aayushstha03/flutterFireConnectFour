class GameBoard {
  static const int rows = 6;
  static const int columns = 7;
  List<List<int>> board;

  GameBoard() : board = List.generate(rows, (_) => List.filled(columns, 0));

  GameBoard.fromFirestore(List<dynamic> firestoreBoard)
      : board = List<List<int>>.from(
            firestoreBoard.map((row) => List<int>.from(row)));

  List<List<int>> toFirestore() => board;

  bool dropDisc(int column, int player) {
    for (int row = rows - 1; row >= 0; row--) {
      if (board[row][column] == 0) {
        board[row][column] = player;
        return true;
      }
    }
    return false;
  }

  bool checkForWin(int player) {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (board[row][col] == player) {
          if (checkVertical(row, col, player) ||
              checkHorizontal(row, col, player) ||
              checkDiagonal(row, col, player)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool checkVertical(int row, int col, int player) {
    if (row + 3 < rows) {
      return board[row + 1][col] == player &&
          board[row + 2][col] == player &&
          board[row + 3][col] == player;
    }
    return false;
  }

  bool checkHorizontal(int row, int col, int player) {
    if (col + 3 < columns) {
      return board[row][col + 1] == player &&
          board[row][col + 2] == player &&
          board[row][col + 3] == player;
    }
    return false;
  }

  bool checkDiagonal(int row, int col, int player) {
    if (row + 3 < rows && col + 3 < columns) {
      return board[row + 1][col + 1] == player &&
          board[row + 2][col + 2] == player &&
          board[row + 3][col + 3] == player;
    } else if (row + 3 < rows && col - 3 >= 0) {
      return board[row + 1][col - 1] == player &&
          board[row + 2][col - 2] == player &&
          board[row + 3][col - 3] == player;
    }
    return false;
  }
}
