import 'package:ease_player_bloc/domain/models/history.dart';
import 'package:ease_player_bloc/presentation/drawer%20section/menudrawer.dart';
import 'package:ease_player_bloc/presentation/homescreen/widgets/bottomnavbar.dart';
import 'package:ease_player_bloc/presentation/videosection/videoscreen.dart';
import 'package:ease_player_bloc/presentation/widgets/navigations/nextpage.dart';
import 'package:ease_player_bloc/presentation/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/video_bloc.dart';
import '../../application/home/home_bloc.dart';
import '../../domain/db_functions.dart';
import '../fileSection/filesscreen.dart';
import '../myscreenSection/myscreen.dart';
import '../playvideos/videoplay.dart';
import '../screen_functions/Screenwidgets/screenwidgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final screens = [
    FileScreen(),
    const VideoScreen(),
    const MyScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(Getthumbnail());
    });
    print(" context called");

    return Scaffold(
      appBar: appBar(context: context),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print("bloc called");

          return screens[state.index];
        },
      ),
      bottomNavigationBar: const BottomNavWidget(),
      floatingActionButton: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          return FloatingActionButton(
              onPressed: () {
                BlocProvider.of<VideoBloc>(context).add(const GetallHistory());

                if (state.historyList.isEmpty) {
                  snackBarPop(
                      context: context,
                      text: "No recently played item in history");
                  return;
                } else {
                  String lastpalyed =
                      state.historyList[state.historyList.length - 1].path;
                  nextPage(
                      page: VideoPlay(
                        path: lastpalyed,
                        name: 'last played',
                      ),
                      context: context);
                }
              },
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 40,
              ));
        },
      ),
      drawer: MenuDrawer(),
    );
  }
}
