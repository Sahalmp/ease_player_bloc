import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/screen_functions/Screenwidgets/screenwidgets.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<Getbottomnavbarpage>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
    on<Getthumbnail>((event, emit) {
      getinfo();
      thumbnailGetter();
    });
    on<Changetheme>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });
  }
}
