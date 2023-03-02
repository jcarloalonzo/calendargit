// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.userId,
    this.personId,
    this.personTypeId,
    this.documentTypeId,
    this.documentNumber,
    this.phoneNumber,
    this.emailAddress,
    this.name,
    this.userBusinessDto,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userId: json['UserID'],
        personId: json['PersonID'],
        personTypeId: json['PersonTypeID'],
        documentTypeId: json['DocumentTypeID'],
        documentNumber: json['DocumentNumber'],
        phoneNumber: json['PhoneNumber'],
        emailAddress: json['EmailAddress'],
        name: json['Name'],
        userBusinessDto: List<UserBusinessDto>.from(
            json['UserBusinessDTO'].map((x) => UserBusinessDto.fromJson(x))),
      );

  int? userId;
  int? personId;
  int? personTypeId;
  int? documentTypeId;
  String? documentNumber;
  String? phoneNumber;
  String? emailAddress;
  String? name;
  List<UserBusinessDto>? userBusinessDto;

  Map<String, dynamic> toJson() => {
        'UserID': userId,
        'PersonID': personId,
        'PersonTypeID': personTypeId,
        'DocumentTypeID': documentTypeId,
        'DocumentNumber': documentNumber,
        'PhoneNumber': phoneNumber,
        'EmailAddress': emailAddress,
        'Name': name,
        'UserBusinessDTO':
            List<dynamic>.from(userBusinessDto!.map((x) => x.toJson())),
      };
}

class UserBusinessDto {
  UserBusinessDto({
    this.businessId,
    this.identification,
    this.businessTypeId,
    this.businessName,
    this.legalName,
    this.officeId,
    this.officeCode,
    this.officeType,
    this.descriptionOffice,
    this.storageId,
    this.storageCode,
    this.storageType,
    this.descriptionStorage,
  });
  factory UserBusinessDto.fromJson(Map<String, dynamic> json) =>
      UserBusinessDto(
        businessId: json['BusinessID'],
        identification: json['Identification'],
        businessTypeId: json['BusinessTypeID'],
        businessName: json['BusinessName'],
        legalName: json['LegalName'],
        officeId: json['OfficeID'],
        officeCode: json['OfficeCode'],
        officeType: json['OfficeType'],
        descriptionOffice: json['DescriptionOffice'],
        storageId: json['StorageID'],
        storageCode: json['StorageCode'],
        storageType: json['StorageType'],
        descriptionStorage: json['DescriptionStorage'],
      );

  int? businessId;
  String? identification;
  int? businessTypeId;
  String? businessName;
  String? legalName;
  int? officeId;
  String? officeCode;
  int? officeType;
  String? descriptionOffice;
  int? storageId;
  String? storageCode;
  int? storageType;
  String? descriptionStorage;

  Map<String, dynamic> toJson() => {
        'BusinessID': businessId,
        'Identification': identification,
        'BusinessTypeID': businessTypeId,
        'BusinessName': businessName,
        'LegalName': legalName,
        'OfficeID': officeId,
        'OfficeCode': officeCode,
        'OfficeType': officeType,
        'DescriptionOffice': descriptionOffice,
        'StorageID': storageId,
        'StorageCode': storageCode,
        'StorageType': storageType,
        'DescriptionStorage': descriptionStorage,
      };
}
