import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'history.g.dart';


@HiveType(typeId: 4)
class HistoryModel extends HiveObject {
  @HiveField(0)
  final String path;
  HistoryModel({required this.path});
}
