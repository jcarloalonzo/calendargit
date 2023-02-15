// To parse this JSON data, do
//
//     final anulaBookingRequest = anulaBookingRequestFromJson(jsonString);

import 'dart:convert';

AnulaBookingRequest anulaBookingRequestFromJson(String str) =>
    AnulaBookingRequest.fromJson(json.decode(str));

String anulaBookingRequestToJson(AnulaBookingRequest data) =>
    json.encode(data.toJson());

class AnulaBookingRequest {
  AnulaBookingRequest({
    this.bookingId,
    this.user,
    this.businessId,
    this.businessIdent,
    this.reason,
  });

  int? bookingId;
  int? user;
  int? businessId;
  String? businessIdent;
  String? reason;

  factory AnulaBookingRequest.fromJson(Map<String, dynamic> json) =>
      AnulaBookingRequest(
        bookingId: json["bookingID"],
        user: json["user"],
        businessId: json["businessID"],
        businessIdent: json["businessIdent"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "bookingID": bookingId,
        "user": user,
        "businessID": businessId,
        "businessIdent": businessIdent,
        "reason": reason,
      };
}
