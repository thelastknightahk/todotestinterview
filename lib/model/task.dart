import 'dart:convert';

class Task {
  String? nameTask;
  String? categoryName;
  String? dateTask;
  int? colorTaskIndex;
  bool? finishTask;
  String? timeTask;
  Task({
    this.nameTask,
    this.categoryName,
    this.dateTask,
    this.colorTaskIndex,
    this.finishTask,
    this.timeTask,
  });

  Task copyWith({
    String? nameTask,
    String? categoryName,
    String? dateTask,
    int? colorTaskIndex,
    bool? finishTask,
    String? timeTask,
  }) {
    return Task(
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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      nameTask: map['nameTask'],
      categoryName: map['categoryName'],
      dateTask: map['dateTask'],
      colorTaskIndex: map['colorTaskIndex']?.toInt(),
      finishTask: map['finishTask'],
      timeTask: map['timeTask'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(nameTask: $nameTask, categoryName: $categoryName, dateTask: $dateTask, colorTaskIndex: $colorTaskIndex, finishTask: $finishTask, timeTask: $timeTask)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
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
