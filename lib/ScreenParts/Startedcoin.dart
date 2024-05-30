import 'package:connect4/ScreenParts/Cell.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
bool start_coin = false;

class Started_coin extends StatelessWidget {
  const Started_coin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
              child: Text(
            "Connect 4 ",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Which coin will start!!! ",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          start_coin = true;
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Cell(col: 'o'),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          start_coin = false;
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Cell(col: 'b'),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
