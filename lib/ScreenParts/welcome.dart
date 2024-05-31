import 'package:flutter/material.dart';

import '../Connect4Screen.dart';
import 'Bar.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Connect 4 ",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                coin = [
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w']
                ];
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Connect4Screen();
                }));
              },
              child: const Text(
                'Start Game!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
