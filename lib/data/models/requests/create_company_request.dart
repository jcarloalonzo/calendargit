// To parse this JSON data, do
//
//     final createCompanyRequest = createCompanyRequestFromJson(jsonString);

import 'dart:convert';

class CreateCompanyRequest {
  CreateCompanyRequest({
    this.identification,
    this.businessTypeId,
    this.businessName,
    this.emailAddress,
    this.legalName,
    this.phoneNumber,
    this.contactPhoneNumber,
    this.contactPersonName,
    this.codeuid,
    this.active,
    this.officeName,
    this.officePhone,
    this.adress,
    this.userLogin,
    this.userPassToken,
    this.categoriesIds = const [],
    this.servicesIds = const [],
  });
  factory CreateCompanyRequest.fromJson(Map<String, dynamic> json) =>
      CreateCompanyRequest(
        identification: json['Identification'],
        businessTypeId: json['BusinessTypeID'],
        businessName: json['BusinessName'],
        emailAddress: json['EmailAddress'],
        legalName: json['LegalName'],
        phoneNumber: json['PhoneNumber'],
        contactPhoneNumber: json['ContactPhoneNumber'],
        contactPersonName: json['ContactPersonName'],
        codeuid: json['CODEUID'],
        active: json['Active'],
        officeName: json['officeName'],
        officePhone: json['officePhone'],
        adress: json['adress'],
        userLogin: json['userLogin'],
        userPassToken: json['userPassToken'],
        categoriesIds: List<EsIdRequest>.from(
            json['categoriesIds'].map((x) => EsIdRequest.fromJson(x))),
        servicesIds: List<EsIdRequest>.from(
            json['servicesIds'].map((x) => EsIdRequest.fromJson(x))),
      );

  factory CreateCompanyRequest.fromRawJson(String str) =>
      CreateCompanyRequest.fromJson(json.decode(str));

  String? identification;
  int? businessTypeId;
  String? businessName;
  String? emailAddress;
  String? legalName;
  String? phoneNumber;
  String? contactPhoneNumber;
  String? contactPersonName;
  String? codeuid;
  bool? active;
  String? officeName;
  String? officePhone;
  String? adress;
  String? userLogin;
  String? userPassToken;
  List<EsIdRequest> categoriesIds;
  List<EsIdRequest> servicesIds;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'Identification': identification,
        'BusinessTypeID': businessTypeId,
        'BusinessName': businessName,
        'EmailAddress': emailAddress,
        'LegalName': legalName,
        'PhoneNumber': phoneNumber,
        'ContactPhoneNumber': contactPhoneNumber,
        'ContactPersonName': contactPersonName,
        'CODEUID': codeuid,
        'Active': active,
        'officeName': officeName,
        'officePhone': officePhone,
        'adress': adress,
        'userLogin': userLogin,
        'userPassToken': userPassToken,
        'categoriesIds':
            List<dynamic>.from(categoriesIds.map((x) => x.toJson())),
        'servicesIds': List<dynamic>.from(servicesIds.map((x) => x.toJson())),
      };
}

class EsIdRequest {
  EsIdRequest({
    required this.id,
  });
  factory EsIdRequest.fromJson(Map<String, dynamic> json) => EsIdRequest(
        id: json['ID'],
      );

  factory EsIdRequest.fromRawJson(String str) =>
      EsIdRequest.fromJson(json.decode(str));

  int id;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'ID': id,
      };

  static List<EsIdRequest> esIdRequestFromJson(String str) =>
      List<EsIdRequest>.from(
          json.decode(str).map((x) => EsIdRequest.fromJson(x)));

  static String esIdRequestToJson(List<EsIdRequest> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
