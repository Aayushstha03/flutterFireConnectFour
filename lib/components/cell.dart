import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class Cell extends StatelessWidget {
  final int value;

  const Cell({super.key, required this.value});
// help me get the current player colors from GameProvider

  @override
  Widget build(BuildContext context) {
    // ...
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: value == 1
            ? Provider.of<GameProvider>(context).getPlayerOneColor()
            : value == 2
                ? Provider.of<GameProvider>(context).getPlayerTwoColor()
                : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
