import 'dart:convert';

import 'package:hive/hive.dart';

part 'task_data.g.dart';

@HiveType(typeId: 1)
class TaskData {
  @HiveField(0)
  String? nameTask;

  @HiveField(1)
  String? categoryName;

  @HiveField(2)
  String? dateTask;

  @HiveField(3)
  int? colorTaskIndex;

  @HiveField(4)
  bool? finishTask;

  @HiveField(5)
  String? timeTask;
  TaskData({
    this.nameTask,
    this.categoryName,
    this.dateTask,
    this.colorTaskIndex,
    this.finishTask,
    this.timeTask,
  });
   

  TaskData copyWith({
    String? nameTask,
    String? categoryName,
    String? dateTask,
    int? colorTaskIndex,
    bool? finishTask,
    String? timeTask,
  }) {
    return TaskData(
      nameTask: nameTask ?? this.nameTask,
      categoryName: categoryName ?? this.categoryName,
      dateTask: dateTask ?? this.dateTask,
      colorTaskIndex: colorTaskIndex ?? this.colorTaskIndex,
      finishTask: finishTask ?? this.finishTask,
      timeTask: timeTask ?? this.timeTask,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameTask': nameTask,
      'categoryName': categoryName,
      'dateTask': dateTask,
      'colorTaskIndex': colorTaskIndex,
      'finishTask': finishTask,
      'timeTask': timeTask,
    };
  }

  factory TaskData.fromMap(Map<String, dynamic> map) {
    return TaskData(
      nameTask: map['nameTask'],
      categoryName: map['categoryName'],
      dateTask: map['dateTask'],
      colorTaskIndex: map['colorTaskIndex']?.toInt(),
      finishTask: map['finishTask'],
      timeTask: map['timeTask'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskData.fromJson(String source) => TaskData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskData(nameTask: $nameTask, categoryName: $categoryName, dateTask: $dateTask, colorTaskIndex: $colorTaskIndex, finishTask: $finishTask, timeTask: $timeTask)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TaskData &&
      other.nameTask == nameTask &&
      other.categoryName == categoryName &&
      other.dateTask == dateTask &&
      other.colorTaskIndex == colorTaskIndex &&
      other.finishTask == finishTask &&
      other.timeTask == timeTask;
  }

  @override
  int get hashCode {
    return nameTask.hashCode ^
      categoryName.hashCode ^
      dateTask.hashCode ^
      colorTaskIndex.hashCode ^
      finishTask.hashCode ^
      timeTask.hashCode;
  }
}
