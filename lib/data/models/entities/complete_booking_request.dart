// To parse this JSON data, do
//
//     final completeBookingRequest = completeBookingRequestFromJson(jsonString);

import 'dart:convert';

CompleteBookingRequest completeBookingRequestFromJson(String str) =>
    CompleteBookingRequest.fromJson(json.decode(str));

String completeBookingRequestToJson(CompleteBookingRequest data) =>
    json.encode(data.toJson());

class CompleteBookingRequest {
  CompleteBookingRequest({
    this.bookingId,
    this.authorizedUser,
    this.businessId,
    this.businessIdent,
    this.officeId,
  });
  factory CompleteBookingRequest.fromJson(Map<String, dynamic> json) =>
      CompleteBookingRequest(
        bookingId: json['bookingID'],
        authorizedUser: json['AuthorizedUser'],
        businessId: json['businessID'],
        businessIdent: json['businessIdent'],
        officeId: json['officeID'],
      );

  int? bookingId;
  int? authorizedUser;
  int? businessId;
  String? businessIdent;
  int? officeId;

  Map<String, dynamic> toJson() => {
        'bookingID': bookingId,
        'AuthorizedUser': authorizedUser,
        'businessID': businessId,
        'businessIdent': businessIdent,
        'officeID': officeId,
      };
}
