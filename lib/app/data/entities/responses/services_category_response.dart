import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_category_response.freezed.dart';
part 'services_category_response.g.dart';

@freezed
class ServicesCategoryResponse with _$ServicesCategoryResponse {
  const factory ServicesCategoryResponse({
    @JsonKey(name: 'serviceID') required int serviceId,
    @JsonKey(name: 'categoryID') required int categoryId,
    @JsonKey(name: 'descriptionCategory') required String descriptionCategory,
    @JsonKey(name: 'serviceCode') required String serviceCode,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'shortDescription') required String shortDescription,
    @JsonKey(name: 'uImage') String? uImage,
    @JsonKey(name: 'observation') String? observation,
    @JsonKey(name: 'activate') required bool activate,
    @JsonKey(name: 'online') required bool online,
    @JsonKey(name: 'time') required String time,
    @JsonKey(name: 'registerDate') required DateTime registerDate,
    @JsonKey(name: 'registerUsr') required int registerUsr,
  }) = _ServicesCategoryResponse;

  factory ServicesCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesCategoryResponseFromJson(json);
}
