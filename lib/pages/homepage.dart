import 'package:connect4/components/board.dart';
import 'package:connect4/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect 4')),
      body: Column(
        children: [
          Expanded(
            child: BoardWidget(),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<GameProvider>(context, listen: false).resetGame();
            },
            child: Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}
