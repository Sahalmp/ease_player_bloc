part of 'video_bloc.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState(
      {required List<FavouritesModel> favouritesList,
      required List<HistoryModel> historyList}
      ) = _VideoState;

  factory VideoState.initial() =>
      const VideoState(favouritesList: [], historyList: []);
}
