// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDataAdapter extends TypeAdapter<TaskData> {
  @override
  final int typeId = 1;

  @override
  TaskData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskData(
      nameTask: fields[0] as String?,
      categoryName: fields[1] as String?,
      dateTask: fields[2] as String?,
      colorTaskIndex: fields[3] as int?,
      finishTask: fields[4] as bool?,
      timeTask: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nameTask)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.dateTask)
      ..writeByte(3)
      ..write(obj.colorTaskIndex)
      ..writeByte(4)
      ..write(obj.finishTask)
      ..writeByte(5)
      ..write(obj.timeTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
