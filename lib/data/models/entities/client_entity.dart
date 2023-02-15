// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

List<ClientEntity> clientFromJson(String str) => List<ClientEntity>.from(
    json.decode(str).map((x) => ClientEntity.fromJson(x)));

class ClientEntity {
  ClientEntity({
    this.clientId,
    this.documentTypeId,
    this.identification,
    this.legalName,
    this.name,
    this.surName,
    this.secondSurName,
    this.sexId,
    this.birthday,
    this.phoneNumber,
    this.emailAddress,
    this.activate,
    this.userCodeUi,
  });

  int? clientId;
  int? documentTypeId;
  String? identification;
  String? legalName;
  String? name;
  String? surName;
  String? secondSurName;
  String? sexId;
  DateTime? birthday;
  String? phoneNumber;
  String? emailAddress;
  bool? activate;
  String? userCodeUi;

  factory ClientEntity.fromJson(Map<String, dynamic> json) => ClientEntity(
        clientId: json["clientID"],
        documentTypeId: json["documentTypeID"],
        identification:
            json["identification"],
        legalName: json["legalName"],
        name: json["name"],
        surName: json["surName"],
        secondSurName: json["secondSurName"],
        sexId: json["sexID"],
        birthday: json["birthday"],
        phoneNumber: json["phoneNumber"],
        emailAddress:
            json["emailAddress"],
        activate: json["activate"],
        userCodeUi: json["userCodeUI"],
      );
}
