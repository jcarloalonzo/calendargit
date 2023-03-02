import 'dart:convert';

List<BookingHome> bookingCardHomeFromJson(String str) => List<BookingHome>.from(
    json.decode(str).map((x) => BookingHome.fromJson(x)));

String bookingCardHomeToJson(List<BookingHome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingHome {
  BookingHome({
    required this.bookingId,
    required this.bookingCode,
    this.serviceDescription,
    required this.date,
    required this.initialTime,
    required this.finalTime,
    this.bookingState,
    this.name,
  });
  factory BookingHome.fromJson(Map<String, dynamic> json) => BookingHome(
        bookingId: json['BookingID'],
        bookingCode: json['BookingCode'],
        serviceDescription: json['ServiceDescription'],
        date: DateTime.parse(json['Date']),
        initialTime: json['InitialTime'],
        finalTime: json['FinalTime'],
        bookingState: json['BookingState'],
        name: json['Name'],
      );

  int bookingId;
  String bookingCode;
  String? serviceDescription;
  DateTime date;
  String initialTime;
  String finalTime;
  String? bookingState;
  String? name;

  Map<String, dynamic> toJson() => {
        'BookingID': bookingId,
        'BookingCode': bookingCode,
        'ServiceDescription': serviceDescription,
        'Date': date.toIso8601String(),
        'InitialTime': initialTime,
        'FinalTime': finalTime,
        'BookingState': bookingState,
        'Name': name,
      };
}
