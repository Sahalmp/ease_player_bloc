import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ease_player_bloc/domain/constants/constants.dart';
import 'package:ease_player_bloc/domain/models/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'application/bloc/video_bloc.dart';
import 'application/home/home_bloc.dart';
import 'domain/di/di.dart';
import 'domain/models/favourite.dart';
import 'presentation/Splash/SplashScreen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HistoryModelAdapter().typeId)) {
    Hive.registerAdapter(HistoryModelAdapter());
  }

  if (!Hive.isAdapterRegistered(FavouritesModelAdapter().typeId)) {
    Hive.registerAdapter(FavouritesModelAdapter());
  }
  await configureInjection();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(VideoApp(savedThemeMode: savedThemeMode));
}

List thumblist = [];

List<String> pathList = [];

class VideoApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  VideoApp({Key? key, this.savedThemeMode}) : super(key: key);

  bool permissionGranted = false;

  Future<bool> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      permissionGranted == true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      permissionGranted = false;
    }
    return permissionGranted;
  }

  @override
  Widget build(BuildContext context) {
    print("permision $permissionGranted");
    _getStoragePermission();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => getIt<HomeBloc>()),
          BlocProvider(create: (ctx) => getIt<VideoBloc>()),
        ],
        child: AdaptiveTheme(
          light: theme(),
          dark: ThemeData.dark(),
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (theme, darkTheme) {
            return MaterialApp(
                theme: theme,
                darkTheme: darkTheme,
                home: const SplashScreen(),
                debugShowCheckedModeBanner: false);
          },
        ));
  }

  ThemeData theme() {
    return ThemeData(
      listTileTheme: const ListTileThemeData(
        iconColor: Color(0x617d7d7d),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff233F78)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: const Color(0xff233F78),
      )),
      scaffoldBackgroundColor: const Color.fromARGB(255, 251, 244, 244),
      primaryColor: const Color(0xffffffff),
    );
  }
}
