// To parse this JSON data, do
//
//     final toRegisterScheduleFreeResponse = toRegisterScheduleFreeResponseFromJson(jsonString);

import 'dart:convert';

ToRegisterScheduleFreeResponse toRegisterScheduleFreeResponseFromJson(
        String str) =>
    ToRegisterScheduleFreeResponse.fromJson(json.decode(str));

String toRegisterScheduleFreeResponseToJson(
        ToRegisterScheduleFreeResponse data) =>
    json.encode(data.toJson());

class ToRegisterScheduleFreeResponse {
  ToRegisterScheduleFreeResponse({
    this.bookingId,
    this.bookingCode,
  });
  factory ToRegisterScheduleFreeResponse.fromJson(Map<String, dynamic> json) =>
      ToRegisterScheduleFreeResponse(
        bookingId: json['BookingID'],
        bookingCode: json['BookingCode'],
      );

  int? bookingId;
  String? bookingCode;

  Map<String, dynamic> toJson() => {
        'BookingID': bookingId,
        'BookingCode': bookingCode,
      };
}
