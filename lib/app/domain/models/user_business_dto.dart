import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_business_dto.freezed.dart';
part 'user_business_dto.g.dart';

@freezed
class UserBusinessDto with _$UserBusinessDto {
  const factory UserBusinessDto({
    @JsonKey(name: 'BusinessID') required int businessId,
    @JsonKey(name: 'Identification') required String identification,
    @JsonKey(name: 'BusinessTypeID') required int businessTypeId,
    @JsonKey(name: 'BusinessName') required String businessName,
    @JsonKey(name: 'LegalName') required String legalName,
    @JsonKey(name: 'OfficeID') required int officeId,
    @JsonKey(name: 'OfficeCode') required String officeCode,
    @JsonKey(name: 'OfficeType') required int officeType,
    @JsonKey(name: 'DescriptionOffice') required String descriptionOffice,
    @JsonKey(name: 'StorageID') required int storageId,
    @JsonKey(name: 'StorageCode') String? storageCode,
    @JsonKey(name: 'StorageType') required int storageType,
    @JsonKey(name: 'DescriptionStorage') String? descriptionStorage,
  }) = _UserBusinessDto;

  factory UserBusinessDto.fromJson(Map<String, dynamic> json) =>
      _$UserBusinessDtoFromJson(json);
}
