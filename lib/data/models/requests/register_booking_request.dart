// To parse this JSON data, do
//
//     final registerBookingRequest = registerBookingRequestFromJson(jsonString);

import 'dart:convert';

RegisterBookingRequest registerBookingRequestFromJson(String str) =>
    RegisterBookingRequest.fromJson(json.decode(str));

String registerBookingRequestToJson(RegisterBookingRequest data) =>
    json.encode(data.toJson());

class RegisterBookingRequest {
  RegisterBookingRequest({
    this.officeId,
    this.serviceId,
    this.personId,
    this.clientId,
    this.observation,
    this.price,
    this.date,
    this.initialTime,
    this.finalTime,
    this.bookingStateId,
    this.onlineApp,
    this.registerUser,
    this.client,
  });
  factory RegisterBookingRequest.fromJson(Map<String, dynamic> json) =>
      RegisterBookingRequest(
        officeId: json['officeID'],
        serviceId: json['serviceID'],
        personId: json['personID'],
        clientId: json['clientID'],
        observation: json['observation'],
        price: json['price'],
        date: (json['date']),
        initialTime: json['initialTime'],
        finalTime: json['finalTime'],
        bookingStateId: json['bookingStateID'],
        onlineApp: json['onlineApp'],
        registerUser: json['registerUser'],
        client: ClientBookingRequest.fromJson(json['client']),
      );

  int? officeId;
  int? serviceId;
  int? personId;
  int? clientId;
  String? observation;
  num? price;
  String? date;
  String? initialTime;
  String? finalTime;
  int? bookingStateId;
  bool? onlineApp;
  int? registerUser;
  ClientBookingRequest? client;

  Map<String, dynamic> toJson() => {
        'officeID': officeId,
        'serviceID': serviceId,
        'personID': personId,
        'clientID': clientId,
        'observation': observation,
        'price': price,
        'date': date,
        'initialTime': initialTime,
        'finalTime': finalTime,
        'bookingStateID': bookingStateId,
        'onlineApp': onlineApp,
        'registerUser': registerUser,
        'client': client?.toJson(),
      };
}

class ClientBookingRequest {
  ClientBookingRequest({
    this.documentTypeId,
    this.identification,
    this.name,
    this.surName,
    this.secondSurname,
    this.phoneNumber,
    this.emailAddress,
    this.sexId,
    this.userCodeUi,
  });
  factory ClientBookingRequest.fromJson(Map<String, dynamic> json) =>
      ClientBookingRequest(
        documentTypeId: json['documentTypeID'],
        identification: json['identification'],
        name: json['name'],
        surName: json['surName'],
        secondSurname: json['SecondSurname'],
        phoneNumber: json['phoneNumber'],
        emailAddress: json['emailAddress'],
        sexId: json['sexID'],
        userCodeUi: json['userCodeUI'],
      );

  int? documentTypeId;
  String? identification;
  String? name;
  String? surName;
  String? secondSurname;
  String? phoneNumber;
  String? emailAddress;
  String? sexId;
  String? userCodeUi;

  Map<String, dynamic> toJson() => {
        'documentTypeID': documentTypeId,
        'identification': identification,
        'name': name,
        'surName': surName,
        'SecondSurname': secondSurname,
        'phoneNumber': phoneNumber,
        'emailAddress': emailAddress,
        'sexID': sexId,
        'userCodeUI': userCodeUi,
      };
}
