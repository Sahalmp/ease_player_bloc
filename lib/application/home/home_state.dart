part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required int index, required List thumbnail, theme}) = _HomeState;
  factory HomeState.initial() =>
      const HomeState(index: 0, thumbnail: [], theme: false);
}
