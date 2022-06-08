// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 4;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel(
      path: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
