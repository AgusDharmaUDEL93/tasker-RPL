// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTableAdapter extends TypeAdapter<TaskTable> {
  @override
  final int typeId = 0;

  @override
  TaskTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskTable(
      title: fields[0] as String,
      description: fields[1] as String,
      expirationDate: fields[2] as DateTime,
      isDone: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskTable obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.expirationDate)
      ..writeByte(3)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
