import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../components/board.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect 4')),
      body: Column(
        children: [
          Expanded(
            child: BoardWidget(),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<GameProvider>(context, listen: false).resetGame();
            },
            child: const Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}
