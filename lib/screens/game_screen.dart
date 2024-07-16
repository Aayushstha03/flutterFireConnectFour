import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/game_provider.dart';
import '../components/board.dart';

class GameScreen extends StatelessWidget {
  final String gameId;
  final String playerId;

  const GameScreen({required this.gameId, required this.playerId, super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.initializeGame(gameId, playerId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect 4'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            DocumentReference gameRef =
                FirebaseFirestore.instance.collection('games').doc(gameId);
            gameRef.delete();
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<GameProvider>(
            builder: (context, provider, child) {
              return Text(
                'Player ${provider.currentPlayer} turn',
                style: TextStyle(
                  fontSize: 20.0,
                  color: provider.currentPlayer == 1
                      ? provider.playerOneColor
                      : provider.playerTwoColor,
                ),
              );
            },
          ),
          const Expanded(
            child: BoardWidget(),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              gameProvider.resetGame();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Durations.extralong1,
                  showCloseIcon: true,
                  content: Text('Board Reset'),
                ),
              );
            },
            label: const Text('Reset Board'),
          ),
        ],
      ),
    );
  }
}
