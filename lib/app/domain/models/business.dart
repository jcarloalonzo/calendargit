import 'package:freezed_annotation/freezed_annotation.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
class Business with _$Business {
  const factory Business({
    @JsonKey(name: 'BusinessID') required int businessId,
    @JsonKey(name: 'Identification') required String identification,
    @JsonKey(name: 'BusinessTypeID') required int businessTypeId,
    @JsonKey(name: 'BusinessName') required String businessName,
    @JsonKey(name: 'EmailAddress') required String emailAddress,
    @JsonKey(name: 'LegalName') required String legalName,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'ContactPersonName') required String contactPersonName,
    @JsonKey(name: 'RegistrationDate') required DateTime registrationDate,
    @JsonKey(name: 'CODEUID') required String codeuid,
    @JsonKey(name: 'Active') required bool active,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}
