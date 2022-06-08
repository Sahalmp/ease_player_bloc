import 'package:hive_flutter/hive_flutter.dart';
    part 'favourite.g.dart';
@HiveType(typeId: 2)
class FavouritesModel {
  @HiveField(0)
  final String path;

  FavouritesModel({required this.path});
}