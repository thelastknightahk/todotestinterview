import 'dart:convert';

class CategoryChoice {
  String? categoryName;
  int? categoryIndex;
  CategoryChoice({
    this.categoryName,
    this.categoryIndex,
  });

  CategoryChoice copyWith({
    String? categoryName,
    int? categoryIndex,
  }) {
    return CategoryChoice(
      categoryName: categoryName ?? this.categoryName,
      categoryIndex: categoryIndex ?? this.categoryIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryIndex': categoryIndex,
    };
  }

  factory CategoryChoice.fromMap(Map<String, dynamic> map) {
    return CategoryChoice(
      categoryName: map['categoryName'],
      categoryIndex: map['categoryIndex']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryChoice.fromJson(String source) =>
      CategoryChoice.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryChoice(categoryName: $categoryName, categoryIndex: $categoryIndex)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryChoice &&
        other.categoryName == categoryName &&
        other.categoryIndex == categoryIndex;
  }

  @override
  int get hashCode => categoryName.hashCode ^ categoryIndex.hashCode;
}
