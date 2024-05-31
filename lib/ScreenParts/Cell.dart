// ignore_for_file: prefer_const_constructors

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Color color; //color
  const Cell({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.13,
          height: MediaQuery.of(context).size.height * 0.065,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.11,
          height: MediaQuery.of(context).size.height * 0.052,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(40))),
        ),
      ],
    );
  }
}
