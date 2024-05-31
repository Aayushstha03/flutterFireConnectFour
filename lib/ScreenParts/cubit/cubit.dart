import 'package:connect4/ScreenParts/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<State_> {
  GameCubit() : super(initState());
  static GameCubit get(context) => BlocProvider.of(context);
  String? player;

  void setPlayer(bool start) {
    player = "Player 1";
    emit(playerState());
  }

  void changePlayer() {
    player = player == 'Player 1' ? 'Player 2' : "Player 1";
    emit(playerState());
  }
}
