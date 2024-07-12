import 'package:connect4/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Color playerOneColor =
      Provider.of<GameProvider>(context).getPlayerOneColor();
  late Color playerTwoColor =
      Provider.of<GameProvider>(context).getPlayerTwoColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //if both player select the same colors, show snackbar
          if (playerOneColor.hashCode == playerTwoColor.hashCode) {
            //show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Durations.extralong1,
                showCloseIcon: true,
                content: Text('Player colors must be different!'),
              ),
            );
          } else {
            //if different save!
            Provider.of<GameProvider>(context, listen: false)
                .setColors(playerOneColor, playerTwoColor);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Durations.extralong1,
                showCloseIcon: true,
                content: Text('Player settings saved!'),
              ),
            );
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
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
                'Player 1',
                style: TextStyle(
                  color: playerOneColor,
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
                    fillColor: MaterialStateProperty.all(Colors.lightGreen),
                    value: Colors.lightGreen,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.pink),
                    value: Colors.pink,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.orange),
                    value: Colors.orange,
                    groupValue: playerOneColor,
                    onChanged: (value) {
                      setState(() {
                        playerOneColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor:
                        MaterialStateProperty.all(Colors.purple.shade300),
                    value: Colors.purple.shade300,
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
                'Player 2',
                style: TextStyle(
                  color: playerTwoColor,
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
                    fillColor: MaterialStateProperty.all(Colors.lightGreen),
                    value: Colors.lightGreen,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.pink),
                    value: Colors.pink,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor: MaterialStateProperty.all(Colors.orange),
                    value: Colors.orange,
                    groupValue: playerTwoColor,
                    onChanged: (value) {
                      setState(() {
                        playerTwoColor = value as Color;
                      });
                    },
                  ),
                  Radio(
                    fillColor:
                        MaterialStateProperty.all(Colors.purple.shade300),
                    value: Colors.purple.shade300,
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
