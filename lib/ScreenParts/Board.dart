import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bar.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

String player = "Orange";

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit()..setPlayer(false),
      child: BlocConsumer<GameCubit, State_>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 18),
                    Text(
                      '${GameCubit.get(context).player} turn',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Barr(index: 0)),
                          Expanded(child: Barr(index: 1)),
                          Expanded(child: Barr(index: 2)),
                          Expanded(child: Barr(index: 3)),
                          Expanded(child: Barr(index: 4)),
                          Expanded(child: Barr(index: 5)),
                          Expanded(child: Barr(index: 6)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
