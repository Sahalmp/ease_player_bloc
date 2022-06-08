part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initialize() = Initialize;
  const factory HomeEvent.getbottomnavbarpage({required int index}) = Getbottomnavbarpage;
  const factory HomeEvent.getthumbnail() = Getthumbnail;
  const factory HomeEvent.viewthumbnail({thumbnails}) = ViewThumbnail;




}