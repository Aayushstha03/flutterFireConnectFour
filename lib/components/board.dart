import 'package:connect4/components/cell.dart';
import 'package:connect4/models/game_board.dart';
import 'package:connect4/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        return Scaffold();
      },
    );
  }
}
