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
        onPressed: () {
          if (playerOne.hashCode == playerTwo.hashCode) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Invalid! Both players have same color!"),
              duration: Durations.long1,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Saved custom colors!"),
              duration: Durations.long1,
            ));

            Navigator.pop(context);
          }
        },
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
                    fillColor: MaterialStateProperty.all(Colors.red),
                    value: Colors.red,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: Colors.blue,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.yellow),
                    value: Colors.yellow,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.teal),
                    value: Colors.teal,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.green),
                    value: Colors.green,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: Colors.purple,
                    groupValue: playerOne,
                    onChanged: (value) {
                      setState(() {
                        playerOne = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
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
                    fillColor: MaterialStateProperty.all(Colors.red),
                    value: Colors.red,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: Colors.blue,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.yellow),
                    value: Colors.yellow,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.teal),
                    value: Colors.teal,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.green),
                    value: Colors.green,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.purple),
                    value: Colors.purple,
                    groupValue: playerTwo,
                    onChanged: (value) {
                      setState(() {
                        playerTwo = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.black),
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