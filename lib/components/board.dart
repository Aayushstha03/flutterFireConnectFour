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
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GameBoard.columns,
          ),
          itemCount: GameBoard.rows * GameBoard.columns,
          itemBuilder: (context, index) {
            int row = index ~/ GameBoard.columns;
            int column = index % GameBoard.columns;
            return GestureDetector(
              onTap: () {
                gameProvider.whenDropedDisc(column, context);
              },
              child: Cell(value: gameProvider.gameBoard.board[row][column]),
            );
          },
        );
      },
    );
  }
}
