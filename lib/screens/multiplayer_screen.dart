import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../components/board.dart';

class MultiPlayerGameScreen extends StatefulWidget {
  const MultiPlayerGameScreen({super.key});

  @override
  _MultiPlayerGameScreenState createState() => _MultiPlayerGameScreenState();
}

class _MultiPlayerGameScreenState extends State<MultiPlayerGameScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the multiplayer game
    Provider.of<GameProvider>(context, listen: false)
        .initializeMultiplayerGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect 4 - Multiplayer'),
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
            'Player ${Provider.of<GameProvider>(context).currentPlayer} turn',
            style: TextStyle(
              fontSize: 20.0,
              color: Provider.of<GameProvider>(context).currentPlayer == 1
                  ? Provider.of<GameProvider>(context).playerOneColor
                  : Provider.of<GameProvider>(context).playerTwoColor,
            ),
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
