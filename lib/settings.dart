import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color playerOne = Colors.red;
  Color playerTwo = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.save_outlined),
        label: const Text('Save'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Select Player 1 color: ${playerOne.value}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: Colors.red,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.blue,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.yellow,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.teal,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.green,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.purple,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.black,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
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
                'Select Player 2 color: ${playerTwo.value}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: Colors.red,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.blue,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.yellow,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.teal,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.green,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.purple,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    value: Colors.black,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
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
