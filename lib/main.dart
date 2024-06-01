import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connect4/ScreenParts/welcome.dart';
import 'package:connect4/ScreenParts/cubit/cubit.dart'; // Import the GameCubit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: MaterialApp(
        title: 'Connect Four',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightGreen,
            brightness: Brightness.dark,
          ),
        ),
        home: const Welcome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
