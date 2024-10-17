import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_contact.freezed.dart';
part 'company_contact.g.dart';

@freezed
class CompanyContact with _$CompanyContact {
  const factory CompanyContact({
    @JsonKey(name: 'CompanyContactID') required int companyContactId,
    @JsonKey(name: 'DocumentTypeID') required String documentTypeId,
    @JsonKey(name: 'DocumentNumber') required String documentNumber,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Surname') required String surname,
    @JsonKey(name: 'SecondSurname') required String secondSurname,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'EmailAdress') required String emailAdress,
    @JsonKey(name: 'Activate') required bool activate,
  }) = _CompanyContact;

  factory CompanyContact.fromJson(Map<String, dynamic> json) =>
      _$CompanyContactFromJson(json);
}
