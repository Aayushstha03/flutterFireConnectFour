import 'package:connect4/ScreenParts/Startedcoin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Connect4Screen.dart';
import 'Bar.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Connect 4 ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                coin = [
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
                  ['w', 'w', 'w', 'w', 'w', 'w', 'w']
                ];
                checkk = start_coin;
                print("started_con ${start_coin}");

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Connect4Screen();
                }));
              },
              child: Text(
                "Let’s Go",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Started_coin();
                }));
              },
              child: Text(
                "Which coin will start",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){
      //     print(checkk);
      //   },
      // ),
    );
  }
}
