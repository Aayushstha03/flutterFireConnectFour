import 'package:connect4/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //logo
            const Image(image: AssetImage('assets/logo.png')),
            const SizedBox(height: 16),
            //buttons for game creation and joining
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(16)),
              ),
              onPressed: () async {
                String gameId = await createGame('player1');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GameScreen(gameId: gameId, playerId: 'player1')));
              },
              child: const Text(
                'Create Game',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(16)),
              ),
              onPressed: () async {
                String gameId = await joinGame('player2');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GameScreen(gameId: gameId, playerId: 'player2')));
              },
              child: const Text(
                'Join Game',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(16)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              child: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> createGame(String playerId) async {
    var board = List.generate(6, (i) => List.filled(7, 0));
    var flatBoard = board.expand((row) => row).toList();
    DocumentReference gameRef =
        await FirebaseFirestore.instance.collection('games').add({
      'player1': playerId,
      'player2': null,
      'board': flatBoard,
      'currentTurn': 'player1',
      'status': 'ongoing',
    });
    return gameRef.id;
  }

  Future<String> joinGame(String playerId) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('games')
        .where('player2', isEqualTo: null)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      DocumentReference gameRef = query.docs.first.reference;
      await gameRef.update({'player2': playerId});
      return gameRef.id;
    } else {
      // Handle no available game to join
      return Future.error('No available game to join');
    }
  }
}
