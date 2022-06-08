import 'package:ease_player_bloc/domain/constants/constants.dart';
import 'package:ease_player_bloc/presentation/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../domain/constants/functions/search_files.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen.withScreenFunction(
            splashIconSize: 150,
            duration: 2000,
            splashTransition: SplashTransition.fadeTransition,
            splash: const Loading(),
            screenFunction: () async {
              await getVideosfromStorage();

              return HomeScreen();
            }));
  }
}

getVideosfromStorage() async {
  final value = ['.mkv', '.mp4', '.mov'];
  SearchFilesInStorage.searchInStorage(value, (List<String> data) {
    pathList.clear();

    pathList.addAll(data);
  }, (error) {});
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logourl,
                width: size.width * 0.4,
              ),
              Container(width: 100, child: const LinearProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
