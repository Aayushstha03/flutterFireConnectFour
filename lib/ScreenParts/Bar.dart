// ignore_for_file: prefer_const_constructors

// ignore: unnecessary_import
import 'package:connect4/ScreenParts/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Connect4Screen.dart';
import 'Cell.dart';
import 'cubit/state.dart';

bool checkk = false; //false
List<List<String>> coin = [
  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w']
];

class Barr extends StatefulWidget {
  final int index;

  const Barr({Key? key, required this.index}) : super(key: key);

  @override
  State<Barr> createState() => _BarrState();
}

class _BarrState extends State<Barr> {
  bool win = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, State_>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            GameCubit.get(context).changePlayer();
            setState(() {
              putCoin(widget.index);
            });
          },
          child: Column(
            children: [
              Cell(col: coin[0][widget.index]),
              Cell(col: coin[1][widget.index]),
              Cell(col: coin[2][widget.index]),
              Cell(col: coin[3][widget.index]),
              Cell(col: coin[4][widget.index]),
              Cell(col: coin[5][widget.index]),
            ],
          ),
        );
      },
    );
  }

  void putCoin(int index) {
    for (int i = 5; i >= 0; i--) {
      if (coin[i][index] == 'w') {
        coin[i][index] = checkk ? 'o' : 'b';
        checkk = !checkk;
        // print("done ${i} + ${coin[i][index]}");
        //print("x  ${i}");
        //print(coin[i][index]);
        checkWin(i, index, coin[i][index]);
        // print(coin);
        break;
      }
    }
  }

  void checkWin(int x, int y, String s) {
    int col = 0;
    int row = 0;
    int diag = 0;
    int rediag = 0;
    String player = s == 'b' ? "Black" : "Orange";
    int rows = coin.length; // row num
    int cols = coin[0].length; // col num
    if (!win) //rule 1 : 4 from same color in same row  win

    {
      for (int i = 0; i < rows; i++) {
        if (coin[i][y] == s)
          col++;
        else {
          col = 0;
        }
        if (col == 4) {
          print("Col win");
          win = true;
          // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
          //   return Connect4Screen();
          // }));
          break;
        }
      }
    }
    if (!win) //rule 2 : 4 from same color in same col win
    {
      for (int i = 0; i < cols; i++) {
        //print(coin[x][i] +"   "+s);
        //print(coin[x][i]);
        if (coin[x][i] == s) {
          row++;
          //print('hiiiii ${i}');
          //print(coin[x][i] +"   "+s);
        } else {
          row = 0;
        }
        //print("Row     ${row}");
        if (row == 4) {
          print("row win");
          win = true;
          break;
        }
      }
    }
    if (!win) //Diagonal   rule 3 : 4 from same color in same diagonal win
    {
      int startRow;
      int startCol;
      if (x < y) {
        startRow = 0;
        startCol = y - x;
      } else if (y < x) {
        startCol = 0;
        startRow = x - y;
      } else {
        startCol = startRow = 0;
      }

      while (startRow < rows && startCol < cols) {
        if (coin[startRow++][startCol++] == s) {
          diag++;
        } else {
          diag = 0;
        }
        if (diag == 4) {
          print("Diag win");
          win = true;
          break;
        }
      }
    }
    if (!win) // rule 4  : 4 from same color in same re_diagonal win
    {
      int startRow;
      int startCol;
      if (x + y == 6) {
        startRow = 0;
        startCol = 6; //cols-1;
      } else if (x + y >= 7) {
        int sub = 6 - y;
        startCol = 6;
        startRow = x - sub;
      } else {
        startRow = 0;
        startCol = y + x;
      }
      // print("revers   start_Row    ${start_Row}       start_Col    ${start_Col}");
      while (startRow < rows && startCol >= 0) {
        if (coin[startRow++][startCol--] == s) {
          rediag++;
        } else {
          rediag = 0;
        }
        if (rediag == 4) {
          print("ReDiag win");
          win = true;
          break;
        }
      }
    }
    int tai = 0;
    for (int i = 0; i < cols; i++) // from 0 to columns num
    {
      if (coin[0][i] == 'w') {
        break;
      } else {
        tai++;
      }
    }

    if (win || tai == cols) {
      win = false;
      checkk = false;

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepOrange,
            title: Container(
              color: Colors.deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: tai == 7
                            ? Text(
                                "Ta3adol",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                "$player is the winner",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Do you want to play again?!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Connect4Screen();
                          }));
                        },
                        child: Icon(Icons.done),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.dangerous_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
