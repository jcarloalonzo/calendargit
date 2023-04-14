// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

class Category {
  Category({
    required this.categoryId,
    required this.description,
    this.shortDescription,
    required this.activate,
    required this.online,
    required this.categoryService,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json['categoryID'],
        description: json['description'],
        shortDescription: json['shortDescription'],
        activate: json['activate'],
        online: json['online'],
        categoryService: json['categoryService'],
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  int categoryId;
  String description;
  String? shortDescription;
  bool activate;
  bool online;
  bool categoryService;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'categoryID': categoryId,
        'description': description,
        'shortDescription': shortDescription,
        'activate': activate,
        'online': online,
        'categoryService': categoryService,
      };
}
