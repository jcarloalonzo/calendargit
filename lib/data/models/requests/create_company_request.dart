// To parse this JSON data, do
//
//     final createCompanyRequest = createCompanyRequestFromJson(jsonString);

import 'dart:convert';

CreateCompanyRequest createCompanyRequestFromJson(String str) =>
    CreateCompanyRequest.fromJson(json.decode(str));

String createCompanyRequestToJson(CreateCompanyRequest data) =>
    json.encode(data.toJson());

class CreateCompanyRequest {
  CreateCompanyRequest({
    this.identification,
    this.businessTypeId,
    this.businessName,
    this.emailAddress,
    this.legalName,
    this.phoneNumber,
    this.contactPersonName,
    this.codeuid,
    this.active,
  });
  factory CreateCompanyRequest.fromJson(Map<String, dynamic> json) =>
      CreateCompanyRequest(
        identification: json['Identification'],
        businessTypeId: json['BusinessTypeID'],
        businessName: json['BusinessName'],
        emailAddress: json['EmailAddress'],
        legalName: json['LegalName'],
        phoneNumber: json['PhoneNumber'],
        contactPersonName: json['ContactPersonName'],
        codeuid: json['CODEUID'],
        active: json['Active'],
      );

  static CreateCompanyRequest createCompanyRequestFromJson(String str) =>
      CreateCompanyRequest.fromJson(json.decode(str));

  static String createCompanyRequestToJson(CreateCompanyRequest data) =>
      json.encode(data.toJson());
  String? identification;
  int? businessTypeId;
  String? businessName;
  String? emailAddress;
  String? legalName;
  String? phoneNumber;
  String? contactPersonName;
  String? codeuid;
  bool? active;

  Map<String, dynamic> toJson() => {
        'Identification': identification,
        'BusinessTypeID': businessTypeId,
        'BusinessName': businessName,
        'EmailAddress': emailAddress,
        'LegalName': legalName,
        'PhoneNumber': phoneNumber,
        'ContactPersonName': contactPersonName,
        'CODEUID': codeuid,
        'Active': active,
      };
}
