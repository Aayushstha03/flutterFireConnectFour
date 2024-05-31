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
        title: const Text(
          "Connect 4 ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
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
                checkk = false;
                print("started_con ${false}");

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Connect4Screen();
                }));
              },
              color: Colors.deepOrange,
              child: const Text(
                "Let’s Go",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
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
