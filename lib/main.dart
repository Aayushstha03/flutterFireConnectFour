import 'package:flutter/material.dart';

import 'ScreenParts/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Four',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber.shade50,
          brightness: Brightness.dark,
        ),
      ),
      home: const Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
