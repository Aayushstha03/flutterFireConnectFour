import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../components/board.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect 4'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Player ${Provider.of<GameProvider>(context).currentPlayer}\'s turn',
            style: const TextStyle(fontSize: 20.0),
          ),
          const Expanded(
            child: BoardWidget(),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Provider.of<GameProvider>(context, listen: false).resetGame();
            },
            label: const Text('Reset Board'),
          ),
        ],
      ),
    );
  }
}
