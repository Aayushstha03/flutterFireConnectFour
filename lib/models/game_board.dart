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

  // In your GameBoard model file
  bool checkForWin(int player) {
    // Implement the logic to check for four consecutive discs of the same player
    // This is a placeholder logic. You need to implement horizontal, vertical, and diagonal checks.
    return false; // Return true if win condition is met
  }
}
