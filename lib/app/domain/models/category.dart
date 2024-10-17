import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'categoryID') required int categoryId,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'shortDescription') required String shortDescription,
    @JsonKey(name: 'activate') required bool activate,
    @JsonKey(name: 'online') required bool online,
    @JsonKey(name: 'categoryService') required bool categoryService,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
