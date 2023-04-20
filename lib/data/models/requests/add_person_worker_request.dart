// To parse this JSON data, do
//
//     final addPersonWorkerRequest = addPersonWorkerRequestFromJson(jsonString);

import 'dart:convert';

class AddPersonWorkerRequest {
  AddPersonWorkerRequest({
    this.businessId,
    this.personTypeId,
    this.documentNumber,
    this.name,
    this.surname,
    this.secondSurname,
    this.phoneNumber,
    this.emailAddress,
    this.description,
    this.officeId,
    this.user,
    this.password,
  });
  factory AddPersonWorkerRequest.fromJson(Map<String, dynamic> json) =>
      AddPersonWorkerRequest(
        businessId: json['businessID'],
        personTypeId: json['personTypeID'],
        documentNumber: json['documentNumber'],
        name: json['name'],
        surname: json['surname'],
        secondSurname: json['secondSurname'],
        phoneNumber: json['phoneNumber'],
        emailAddress: json['emailAddress'],
        description: json['description'],
        officeId: json['officeID'],
        user: json['user'],
        password: json['password'],
      );

  factory AddPersonWorkerRequest.fromRawJson(String str) =>
      AddPersonWorkerRequest.fromJson(json.decode(str));

  int? businessId;
  int? personTypeId;
  String? documentNumber;
  String? name;
  String? surname;
  String? secondSurname;
  String? phoneNumber;
  String? emailAddress;
  String? description;
  int? officeId;
  String? user;
  String? password;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'businessID': businessId,
        'personTypeID': personTypeId,
        'documentNumber': documentNumber,
        'name': name,
        'surname': surname,
        'secondSurname': secondSurname,
        'phoneNumber': phoneNumber,
        'emailAddress': emailAddress,
        'description': description,
        'officeID': officeId,
        'user': user,
        'password': password,
      };
}
