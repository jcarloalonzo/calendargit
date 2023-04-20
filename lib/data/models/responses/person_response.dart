// To parse this JSON data, do
//
//     final personResponse = personResponseFromJson(jsonString);

import 'dart:convert';

class PersonResponse {
  PersonResponse({
    required this.personId,
    required this.personTypeId,
    required this.documentTypeId,
    this.documentNumber,
    this.name,
    this.surname,
    this.secondSurname,
    this.phoneNumber,
    this.emailAddress,
    this.uImage,
    this.description,
    required this.active,
  });
  factory PersonResponse.fromJson(Map<String, dynamic> json) => PersonResponse(
        personId: json['personID'],
        personTypeId: json['personTypeID'],
        documentTypeId: json['documentTypeID'],
        documentNumber: json['documentNumber'],
        name: json['name'],
        surname: json['surname'],
        secondSurname: json['secondSurname'],
        phoneNumber: json['phoneNumber'],
        emailAddress: json['emailAddress'],
        uImage: json['uImage'],
        description: json['description'],
        active: json['active'],
      );

  factory PersonResponse.fromRawJson(String str) =>
      PersonResponse.fromJson(json.decode(str));

  int personId;
  int personTypeId;
  int documentTypeId;
  String? documentNumber;
  String? name;
  String? surname;
  String? secondSurname;
  String? phoneNumber;
  String? emailAddress;
  String? uImage;
  String? description;
  bool active;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'personID': personId,
        'personTypeID': personTypeId,
        'documentTypeID': documentTypeId,
        'documentNumber': documentNumber,
        'name': name,
        'surname': surname,
        'secondSurname': secondSurname,
        'phoneNumber': phoneNumber,
        'emailAddress': emailAddress,
        'uImage': uImage,
        'description': description,
        'active': active,
      };
}
