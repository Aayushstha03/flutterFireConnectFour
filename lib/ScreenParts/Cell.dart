
// ignore_for_file: prefer_const_constructors

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String col; //color
  const Cell({Key? key,required this.col}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color c;
    if(col=='w'){  //white
       c=Colors.white;
    }
    else if(col=='o'){  //orange
      c=Colors.deepOrangeAccent;

    }
    else
      {
         c=Colors.black;   //black
      }
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(

          width: MediaQuery.of(context).size.width*0.13,
          height: MediaQuery.of(context).size.height*0.065,
          decoration: BoxDecoration(
            color: Colors.amber,

          ),
        ),

        Container(

          width: MediaQuery.of(context).size.width*0.11,
          height: MediaQuery.of(context).size.height*0.052,
          decoration: BoxDecoration(
              color: c,
              borderRadius: BorderRadius.all(Radius.circular(40))
          ),
        ),
      ],
    );
  }
}

