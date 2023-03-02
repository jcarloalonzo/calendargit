// To parse this JSON data, do
//
//     final reprogramRequest = reprogramRequestFromJson(jsonString);

import 'dart:convert';

ReprogramRequest reprogramRequestFromJson(String str) =>
    ReprogramRequest.fromJson(json.decode(str));

String reprogramRequestToJson(ReprogramRequest data) =>
    json.encode(data.toJson());

class ReprogramRequest {
  ReprogramRequest({
    this.bookingId,
    this.user,
    this.businessId,
    this.businessIdent,
    this.date,
    this.initialTime,
    this.finalTime,
  });
  factory ReprogramRequest.fromJson(Map<String, dynamic> json) =>
      ReprogramRequest(
        bookingId: json['bookingID'],
        user: json['User'],
        businessId: json['businessID'],
        businessIdent: json['businessIdent'],
        date: (json['date']),
        initialTime: json['initialTime'],
        finalTime: json['finalTime'],
      );

  int? bookingId;
  int? user;
  int? businessId;
  String? businessIdent;
  String? date;
  String? initialTime;
  String? finalTime;

  Map<String, dynamic> toJson() => {
        'bookingID': bookingId,
        'User': user,
        'businessID': businessId,
        'businessIdent': businessIdent,
        'date': date,
        'initialTime': initialTime,
        'finalTime': finalTime,
      };
}
