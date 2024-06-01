// ignore_for_file: prefer_const_constructors

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board.dart';

class Connect4Screen extends StatelessWidget {
  const Connect4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Board(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.close),
        label: Text('Quit'),
      ),
    );
  }
}
