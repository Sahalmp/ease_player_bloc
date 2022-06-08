part of 'video_bloc.dart';

@freezed
class VideoEvent with _$VideoEvent {
  const factory VideoEvent.initialize() = Initialize;
  const factory VideoEvent.addfav({required FavouritesModel model}) = Addfav;
    const factory VideoEvent.getallFav() = GetallFav;
    const factory VideoEvent.delfav({required int index}) = Delfav;
    const factory VideoEvent.addHistory({required HistoryModel model}) = AddHistory;
    const factory VideoEvent.getallHistory() = GetallHistory;
    const factory VideoEvent.delHistory({required int index}) = DelHistory;
    const factory VideoEvent.clearHistory() =ClearHistory;


}
