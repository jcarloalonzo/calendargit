// To parse this JSON data, do
//
//     final validateTokenResponse = validateTokenResponseFromJson(jsonString);

import 'dart:convert';

class ValidateTokenResponse {
  ValidateTokenResponse({
    this.companyId,
    this.companyName,
    this.codeUid,
    this.allowLicense,
    this.isRegister,
  });
  factory ValidateTokenResponse.fromJson(Map<String, dynamic> json) =>
      ValidateTokenResponse(
        companyId: json['CompanyID'],
        companyName: json['CompanyName'],
        codeUid: json['CodeUID'],
        allowLicense: json['AllowLicense'],
        isRegister: json['IsRegister'],
      );

  factory ValidateTokenResponse.fromRawJson(String str) =>
      ValidateTokenResponse.fromJson(json.decode(str));

  int? companyId;
  String? companyName;
  String? codeUid;
  bool? allowLicense;
  bool? isRegister;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'CompanyID': companyId,
        'CompanyName': companyName,
        'CodeUID': codeUid,
        'AllowLicense': allowLicense,
        'IsRegister': isRegister,
      };
}
