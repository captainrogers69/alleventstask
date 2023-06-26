// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoriesModel {
  final String? category;
  final String? data;
  const CategoriesModel({
    required this.category,
    required this.data,
  });

  CategoriesModel copyWith({
    String? category,
    String? data,
  }) {
    return CategoriesModel(
      category: category ?? this.category,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'data': data,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      category: map['category'] != null ? map['category'] as String : null,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesModel(category: $category, data: $data)';

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.category == category && other.data == data;
  }

  @override
  int get hashCode => category.hashCode ^ data.hashCode;
}
