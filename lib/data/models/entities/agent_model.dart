// import 'dart:convert';

// List<BookingAgentModel> bookingAgentModelFromJson(String str) => List<BookingAgentModel>.from(json.decode(str).map((x) => BookingAgentModel.fromJson(x)));

// String bookingAgentModelToJson(List<BookingAgentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BookingAgentModel {
//     BookingAgentModel({
//       required  this.bookingId,
//        required this.bookingCode,
//       required  this.serviceId,
//        required this.serviceDescription,
//        required this.date,
//        required this.initialTime,
//        required this.finalTime,
//        required this.bookingStateId,
//        required this.bookingState,
//         this.observation,
//         this.identification,
//        required this.name,
//         this.phoneNumber,
//         this.emailAddress,
//         this.userCodeUi,
//        required this.price
//     });

//     int bookingId;
//     String bookingCode;
//     int serviceId;
//     String serviceDescription;
//     DateTime date;
//     String initialTime;
//     String finalTime;
//     int bookingStateId;
//     String bookingState;
//     String? observation;
//     String? identification;
//     String name;
//     String? phoneNumber;
//     String? emailAddress;
//     String? userCodeUi;
//     num price;

    

//     factory BookingAgentModel.fromJson(Map<String, dynamic> json) => BookingAgentModel(
//         bookingId: json["BookingID"],
//         bookingCode: json["BookingCode"],
//         serviceId: json["ServiceID"],
//         serviceDescription: json["ServiceDescription"],
//         date: DateTime.parse(json["Date"]),
//         initialTime: json["InitialTime"],
//         finalTime: json["FinalTime"],
//         bookingStateId: json["BookingStateID"],
//         bookingState: json["BookingState"],
//         observation: json["Observation"],
//         identification: json["Identification"],
//         name: json["Name"],
//         phoneNumber: json["PhoneNumber"],
//         emailAddress: json["EmailAddress"],
//         userCodeUi: json["UserCodeUI"],
//         price: json["price"],
//     );

//     Map<String, dynamic> toJson() => {
//         "BookingID": bookingId,
//         "BookingCode": bookingCode,
//         "ServiceID": serviceId,
//         "ServiceDescription": serviceDescription,
//         "Date": date.toIso8601String(),
//         "InitialTime": initialTime,
//         "FinalTime": finalTime,
//         "BookingStateID": bookingStateId,
//         "BookingState": bookingState,
//         "Observation": observation,
//         "Identification": identification,
//         "Name": name,
//         "PhoneNumber": phoneNumber,
//         "EmailAddress": emailAddress,
//         "UserCodeUI": userCodeUi,
//         "price": price,
//     };
// }
