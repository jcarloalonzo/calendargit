import 'package:freezed_annotation/freezed_annotation.dart';

import 'company_address.dart';
import 'company_contact.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'CompanyID') required int companyId,
    @JsonKey(name: 'BusinessID') required int businessId,
    @JsonKey(name: 'BusinessName') required String businessName,
    @JsonKey(name: 'EmailAddress') required String emailAddress,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'TypeCustomerID') required int typeCustomerId,
    @JsonKey(name: 'Identification') required String identification,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'LastName') required String lastName,
    @JsonKey(name: 'CodeUID') required String codeUid,
    @JsonKey(name: 'CompanyName') required String companyName,
    @JsonKey(name: 'WebSite') required String webSite,
    @JsonKey(name: 'Client') required bool client,
    @JsonKey(name: 'Provider') required bool provider,
    @JsonKey(name: 'Automatic') required bool automatic,
    @JsonKey(name: 'TaxLiable') required bool taxLiable,
    @JsonKey(name: 'CodeIC') required String codeIc,
    @JsonKey(name: 'state') required bool state,
    @JsonKey(name: 'AllowLicense') required bool allowLicense,
    @JsonKey(name: 'CompanyAddress')
    required List<CompanyAddress> listCompanyAddress,
    @JsonKey(name: 'CompanyContact')
    required List<CompanyContact> listCompanyContact,
  }) = _Company;

  const Company._();

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  CompanyAddress? get companyAddress =>
      listCompanyAddress.isNotEmpty ? listCompanyAddress.first : null;
  CompanyContact? get companyContact =>
      listCompanyContact.isNotEmpty ? listCompanyContact.first : null;
}
