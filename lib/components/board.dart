import 'package:connect4/components/cell.dart';
import 'package:connect4/models/game_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        //grid view to display the game board
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GameBoard.columns,
          ),
          itemCount: GameBoard.rows * GameBoard.columns,
          itemBuilder: (context, index) {
            //integer division ~/
            int row = index ~/ GameBoard.columns;
            int col = index % GameBoard.columns;
            int cellValue = gameProvider.gameBoard.board[row][col];
            return GestureDetector(
              onTap: () {
                gameProvider.dropDisc(col);
              },
              child: Cell(value: cellValue),
            );
          },
        );
      },
    );
  }
}
