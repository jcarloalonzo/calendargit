// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    this.bookingId,
    this.bookingCode,
    this.serviceId,
    this.serviceDescription,
    this.date,
    this.initialTime,
    this.finalTime,
    this.bookingStateId,
    this.bookingState,
    this.observation,
    this.documentTypeId,
    this.identification,
    this.name,
    this.phoneNumber,
    this.emailAddress,
    this.userCodeUi,
    this.price,
  });
  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        bookingId: json['BookingID'],
        bookingCode: json['BookingCode'],
        serviceId: json['ServiceID'],
        serviceDescription: json['ServiceDescription'],
        date: DateTime.parse(json['Date']),
        initialTime: json['InitialTime'],
        finalTime: json['FinalTime'],
        bookingStateId: json['BookingStateID'],
        bookingState: json['BookingState'],
        observation: json['Observation'],
        documentTypeId: json['DocumentTypeID'],
        identification: json['Identification'],
        name: json['Name'],
        phoneNumber: json['PhoneNumber'],
        emailAddress: json['EmailAddress'],
        userCodeUi: json['UserCodeUI'],
        price: json['price'],
      );

  int? bookingId;
  String? bookingCode;
  int? serviceId;
  String? serviceDescription;
  DateTime? date;
  String? initialTime;
  String? finalTime;
  int? bookingStateId;
  String? bookingState;
  String? observation;
  String? documentTypeId;
  String? identification;
  String? name;
  String? phoneNumber;
  String? emailAddress;
  String? userCodeUi;
  num? price;

  Map<String, dynamic> toJson() => {
        'BookingID': bookingId,
        'BookingCode': bookingCode,
        'ServiceID': serviceId,
        'ServiceDescription': serviceDescription,
        'Date': date,
        'InitialTime': initialTime,
        'FinalTime': finalTime,
        'BookingStateID': bookingStateId,
        'BookingState': bookingState,
        'Observation': observation,
        'DocumentTypeID': documentTypeId,
        'Identification': identification,
        'Name': name,
        'PhoneNumber': phoneNumber,
        'EmailAddress': emailAddress,
        'UserCodeUI': userCodeUi,
        'price': price,
      };
}
