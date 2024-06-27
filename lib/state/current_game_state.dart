import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_game_state.freezed.dart';
part 'current_game_state.g.dart';

@freezed
class CurrentGameStateData with _$CurrentGameStateData {
  factory CurrentGameStateData({
    @Default(0) int counter,
  }) = _CurrentGameStateData;
}

@Riverpod(keepAlive: true)
class CurrentGameState extends _$CurrentGameState {
  @override
  CurrentGameStateData build() {
    return CurrentGameStateData();
  }
}
