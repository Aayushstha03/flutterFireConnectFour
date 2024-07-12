import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../components/board.dart';

class GameScreen extends StatelessWidget {
  final String gameId;
  final String playerId;

  const GameScreen({required this.gameId, required this.playerId, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider()..initializeGame(gameId, playerId),
      child: Scaffold(
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
      ),
    );
  }
}
