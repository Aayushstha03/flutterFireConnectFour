class GameBoard {
  static const int rows = 6;
  static const int columns = 7;
  List<List<int>> board;

  GameBoard() : board = List.generate(rows, (_) => List.filled(columns, 0));

  bool dropDisc(int column, int player) {
    for (int row = rows - 1; row >= 0; row--) {
      if (board[row][column] == 0) {
        board[row][column] = player;
        return true;
      }
    }
    return false;
  }
}
