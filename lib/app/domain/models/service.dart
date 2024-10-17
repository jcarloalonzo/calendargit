import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    @JsonKey(name: 'serviceID') required int serviceId,
    @JsonKey(name: 'categoryID') required int categoryId,
    @JsonKey(name: 'categoryDescription') required String categoryDescription,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'shortDescription') required String shortDescription,
    @JsonKey(name: 'observation') required dynamic observation,
    @JsonKey(name: 'imageUrl') required dynamic imageUrl,
    @JsonKey(name: 'timeService') required String timeService,
    @JsonKey(name: 'observationTemplate') required dynamic observationTemplate,
    @JsonKey(name: 'imageTemplate') required dynamic imageTemplate,
    @JsonKey(name: 'timeTemplate') required String timeTemplate,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
