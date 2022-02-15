import 'dart:convert';

class Category {
  String? categoryName;
  double? jobDone;
  String? taskNumber;
  int? categoryColorIndex;
  Category({
    this.categoryName,
    this.jobDone,
    this.taskNumber,
    this.categoryColorIndex,
  });

  Category copyWith({
    String? categoryName,
    double? jobDone,
    String? taskNumber,
    int? categoryColorIndex,
  }) {
    return Category(
      categoryName: categoryName ?? this.categoryName,
      jobDone: jobDone ?? this.jobDone,
      taskNumber: taskNumber ?? this.taskNumber,
      categoryColorIndex: categoryColorIndex ?? this.categoryColorIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'jobDone': jobDone,
      'taskNumber': taskNumber,
      'categoryColorIndex': categoryColorIndex,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryName: map['categoryName'],
      jobDone: map['jobDone']?.toDouble(),
      taskNumber: map['taskNumber'],
      categoryColorIndex: map['categoryColorIndex']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(categoryName: $categoryName, jobDone: $jobDone, taskNumber: $taskNumber, categoryColorIndex: $categoryColorIndex)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.categoryName == categoryName &&
        other.jobDone == jobDone &&
        other.taskNumber == taskNumber &&
        other.categoryColorIndex == categoryColorIndex;
  }

  @override
  int get hashCode {
    return categoryName.hashCode ^
        jobDone.hashCode ^
        taskNumber.hashCode ^
        categoryColorIndex.hashCode;
  }
}
