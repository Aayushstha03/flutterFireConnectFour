import 'package:connect4/ScreenParts/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<State_> {
  GameCubit() : super(InitState());
  static GameCubit get(context) => BlocProvider.of(context);
  String? player;
  Color? playerOneColor;
  Color? playerTwoColor;

  void setPlayer(bool start) {
    player = "Player 1";
    emit(PlayerState());
  }

  void changePlayer() {
    player = player == 'Player 1' ? 'Player 2' : "Player 1";
    emit(PlayerState());
  }

  void setPlayerColors(Color playerOne, Color playerTwo) {
    playerOneColor = playerOne;
    playerTwoColor = playerTwo;
    emit(PlayerState());
  }
}
