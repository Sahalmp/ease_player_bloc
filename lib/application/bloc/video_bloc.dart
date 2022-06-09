import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/favourite.dart';
import '../../domain/models/history.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

@injectable
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState.initial()) {
    on<Addfav>((event, emit) async {
      final _dB = await Hive.openBox<FavouritesModel>("_favdB");

      await _dB.add(event.model);
      add(const GetallFav());
    });
    on<GetallFav>((event, emit) async {
      emit(const VideoState(favouritesList: [], historyList: []));

      final _dB = await Hive.openBox<FavouritesModel>("_favdB");

      emit(VideoState(favouritesList: _dB.values.toList(), historyList: []));
    });
    on<Delfav>((event, emit) async {
      final _dB = await Hive.openBox<FavouritesModel>("_favdB");

      await _dB.deleteAt(event.index);
      add(const GetallFav());
    });

    //History
    on<AddHistory>((event, emit) async {
      final _dB = await Hive.openBox<HistoryModel>("_hisdB");

      await _dB.add(event.model);
      add(const GetallHistory());
    });
    on<GetallHistory>((event, emit) async {
      emit(const VideoState(favouritesList: [], historyList: []));

      final _dB = await Hive.openBox<HistoryModel>("_hisdB");

      emit(VideoState(historyList: _dB.values.toList(), favouritesList: []));
    });

    //DeleteHistory

    on<DelHistory>((event, emit) async {
      final _dB = await Hive.openBox<HistoryModel>("_hisdB");

      await _dB.deleteAt(event.index);
      add(const GetallHistory());
    });
  }
}
