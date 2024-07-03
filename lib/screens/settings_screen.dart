import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Color playerOneColor = Colors.red;
  late Color playerTwoColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Select Player 1 color: ${playerOneColor.value}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.red),
                    value: Colors.red,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: Colors.blue,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.yellow),
                    value: Colors.yellow,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.teal),
                    value: Colors.teal,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.green),
                    value: Colors.green,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: Colors.purple,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    value: Colors.black,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Select Player 2 color: ${playerTwoColor.value}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.red),
                    value: Colors.red,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: Colors.blue,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.yellow),
                    value: Colors.yellow,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.teal),
                    value: Colors.teal,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.green),
                    value: Colors.green,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: Colors.purple,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
                    value: Colors.black,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
