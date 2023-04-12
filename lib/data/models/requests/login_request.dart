// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

class LoginRequest {
  LoginRequest({
    this.businessId,
    this.emailAddress,
    this.passToken,
  });
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        businessId: json['BusinessID'],
        emailAddress: json['EmailAddress'],
        passToken: json['PassToken'],
      );
  static LoginRequest loginRequestFromJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  static String loginRequestToJson(LoginRequest data) =>
      json.encode(data.toJson());
  int? businessId;
  String? emailAddress;
  String? passToken;

  Map<String, dynamic> toJson() => {
        'BusinessID': businessId,
        'EmailAddress': emailAddress,
        'PassToken': passToken,
      };
}
