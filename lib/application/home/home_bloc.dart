import 'package:bloc/bloc.dart';
import 'package:ease_player_bloc/main.dart';
import 'package:ease_player_bloc/presentation/screen_functions/Screenwidgets/screenwidgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
    
  }
}
