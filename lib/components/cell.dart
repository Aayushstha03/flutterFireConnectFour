import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final int value;

  const Cell({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: value == 1
            ? Colors.red
            : value == 2
                ? Colors.yellow
                : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
