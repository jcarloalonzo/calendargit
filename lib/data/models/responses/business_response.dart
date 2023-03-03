// To parse this JSON data, do
//
//     final businessResponse = businessResponseFromJson(jsonString);

import 'dart:convert';

class BusinessResponse {
  BusinessResponse({
    this.businessId,
    this.identification,
    this.businessTypeId,
    this.businessName,
    this.emailAddress,
    this.legalName,
    this.phoneNumber,
    this.contactPersonName,
    this.registrationDate,
    this.codeuid,
    this.active,
  });
  factory BusinessResponse.fromJson(Map<String, dynamic> json) =>
      BusinessResponse(
        businessId: json['BusinessID'],
        identification: json['Identification'],
        businessTypeId: json['BusinessTypeID'],
        businessName: json['BusinessName'],
        emailAddress: json['EmailAddress'],
        legalName: json['LegalName'],
        phoneNumber: json['PhoneNumber'],
        contactPersonName: json['ContactPersonName'],
        registrationDate: json['RegistrationDate'],
        codeuid: json['CODEUID'],
        active: json['Active'],
      );

  static BusinessResponse businessResponseFromJson(String str) =>
      BusinessResponse.fromJson(json.decode(str));

  static String businessResponseToJson(BusinessResponse data) =>
      json.encode(data.toJson());
  int? businessId;
  String? identification;
  int? businessTypeId;
  String? businessName;
  String? emailAddress;
  String? legalName;
  String? phoneNumber;
  String? contactPersonName;
  String? registrationDate;
  String? codeuid;
  bool? active;

  Map<String, dynamic> toJson() => {
        'BusinessID': businessId,
        'Identification': identification,
        'BusinessTypeID': businessTypeId,
        'BusinessName': businessName,
        'EmailAddress': emailAddress,
        'LegalName': legalName,
        'PhoneNumber': phoneNumber,
        'ContactPersonName': contactPersonName,
        'RegistrationDate': registrationDate,
        'CODEUID': codeuid,
        'Active': active,
      };
}
