import 'package:freezed_annotation/freezed_annotation.dart';

import 'id_request.dart';

part 'company_create_request.freezed.dart';
part 'company_create_request.g.dart';

@freezed
class CompanyCreateRequest with _$CompanyCreateRequest {
  const factory CompanyCreateRequest({
    @JsonKey(name: 'Identification') required String identification,
    @JsonKey(name: 'BusinessTypeID') required int businessTypeId,
    @JsonKey(name: 'BusinessName') required String businessName,
    @JsonKey(name: 'EmailAddress') required String emailAddress,
    @JsonKey(name: 'LegalName') required String legalName,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'ContactPhoneNumber') required String contactPhoneNumber,
    @JsonKey(name: 'ContactPersonName') required String contactPersonName,
    @JsonKey(name: 'CODEUID') required String codeuid,
    @JsonKey(name: 'Active') required bool active,
    @JsonKey(name: 'officeName') required String officeName,
    @JsonKey(name: 'officePhone') required String officePhone,
    @JsonKey(name: 'adress') required String adress,
    @JsonKey(name: 'userLogin') required String userLogin,
    @JsonKey(name: 'userPassToken') required String userPassToken,
    @JsonKey(name: 'categoriesIds') required List<IdRequest> categoriesIds,
    @JsonKey(name: 'servicesIds') required List<IdRequest> servicesIds,
  }) = _CompanyCreateRequest;

  factory CompanyCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CompanyCreateRequestFromJson(json);
}
