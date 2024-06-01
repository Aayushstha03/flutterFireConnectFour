import 'package:connect4/ScreenParts/settings.dart';
import 'package:flutter/material.dart';

import 'Connect4Screen.dart';
import 'Bar.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("assets/logo.png"),
          ),
          FilledButton.tonal(
            onPressed: () {
              coin = [
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ],
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ],
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ],
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ],
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ],
                [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white
                ]
              ];
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Connect4Screen();
              }));
            },
            child: const SizedBox(
              height: 80,
              width: 175,
              child: Center(
                child: Text(
                  'Start Game!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          FilledButton.tonal(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsPage();
              }));
            },
            child: const SizedBox(
              height: 80,
              width: 175,
              child: Center(
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
