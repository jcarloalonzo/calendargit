// To parse this JSON data, do
//
//     final bookingDetail = bookingDetailFromJson(jsonString);

import 'dart:convert';

BookingDetail bookingDetailFromJson(String str) =>
    BookingDetail.fromJson(json.decode(str));

String bookingDetailToJson(BookingDetail data) => json.encode(data.toJson());

class BookingDetail {
  BookingDetail({
    this.bookingId,
    this.businessId,
    this.officeId,
    this.bookingCode,
    this.serviceId,
    this.serviceName,
    this.date,
    this.initialTime,
    this.finalTime,
    this.realFinalTime,
    this.price,
    this.priceFinal,
    this.bookingPerson,
    this.bookingClient,
    this.observation,
    this.bookingStateId,
    this.bookingState,
    this.authorizedUser,
    this.authorizedDate,
    this.onlineApp,
    this.registerDate,
    this.registerUser,
    this.completed,
    this.invoiceState,
    this.bookingInvoice,
  });

  int? bookingId;
  int? businessId;
  int? officeId;
  String? bookingCode;
  int? serviceId;
  String? serviceName;
  String? date;
  String? initialTime;
  String? finalTime;
  String? realFinalTime;
  num? price;
  num? priceFinal;
  BookingPerson? bookingPerson;
  BookingClient? bookingClient;
  String? observation;
  int? bookingStateId;
  String? bookingState;
  int? authorizedUser;
  String? authorizedDate;
  bool? onlineApp;
  String? registerDate;
  int? registerUser;
  bool? completed;
  bool? invoiceState;
  BookingInvoice? bookingInvoice;

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        bookingId: json["bookingID"],
        businessId: json["businessID"],
        officeId: json["officeID"],
        bookingCode: json["bookingCode"],
        serviceId: json["serviceID"],
        serviceName: json["serviceName"],
        date: (json["date"]),
        initialTime: json["initialTime"],
        finalTime: json["finalTime"],
        realFinalTime: json["realFinalTime"],
        price: json["price"],
        priceFinal: json["priceFinal"],
        bookingPerson: BookingPerson.fromJson(json["bookingPerson"]),
        bookingClient: BookingClient.fromJson(json["bookingClient"]),
        observation: json["observation"],
        bookingStateId: json["bookingStateID"],
        bookingState: json["bookingState"],
        authorizedUser: json["authorizedUser"],
        authorizedDate: (json["authorizedDate"]),
        onlineApp: json["onlineApp"],
        registerDate: (json["registerDate"]),
        registerUser: json["registerUser"],
        completed: json["completed"],
        invoiceState: json["invoiceState"],
        bookingInvoice: (json["bookingInvoice"] != null)
            ? BookingInvoice.fromJson(json["bookingInvoice"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "bookingID": bookingId,
        "businessID": businessId,
        "officeID": officeId,
        "bookingCode": bookingCode,
        "serviceID": serviceId,
        "serviceName": serviceName,
        "date": date,
        "initialTime": initialTime,
        "finalTime": finalTime,
        "realFinalTime": realFinalTime,
        "price": price,
        "priceFinal": priceFinal,
        "bookingPerson": bookingPerson?.toJson(),
        "bookingClient": bookingClient?.toJson(),
        "observation": observation,
        "bookingStateID": bookingStateId,
        "bookingState": bookingState,
        "authorizedUser": authorizedUser,
        "authorizedDate": authorizedDate,
        "onlineApp": onlineApp,
        "registerDate": registerDate,
        "registerUser": registerUser,
        "completed": completed,
        "invoiceState": invoiceState,
        "bookingInvoice": bookingInvoice?.toJson(),
      };
}

class BookingClient {
  BookingClient({
    this.bookingPersonId,
    this.bookingId,
    this.documentTypeId,
    this.identification,
    this.name,
    this.surname,
    this.secondSurname,
    this.phoneNumber,
    this.emailAddress,
    this.sexId,
    this.bitrhday,
    this.userCodeUi,
  });

  int? bookingPersonId;
  int? bookingId;
  int? documentTypeId;
  String? identification;
  String? name;
  String? surname;
  String? secondSurname;
  String? phoneNumber;
  String? emailAddress;
  String? sexId;
  String? bitrhday;
  String? userCodeUi;

  factory BookingClient.fromJson(Map<String, dynamic> json) => BookingClient(
        bookingPersonId: json["bookingPersonID"],
        bookingId: json["bookingID"],
        documentTypeId: json["documentTypeID"],
        identification: json["identification"],
        name: json["name"],
        surname: json["surname"],
        secondSurname: json["secondSurname"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        sexId: json["sexID"],
        bitrhday: (json["Bitrhday"]),
        userCodeUi: json["userCodeUI"],
      );

  Map<String, dynamic> toJson() => {
        "bookingPersonID": bookingPersonId,
        "bookingID": bookingId,
        "documentTypeID": documentTypeId,
        "identification": identification,
        "name": name,
        "surname": surname,
        "secondSurname": secondSurname,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "sexID": sexId,
        "Bitrhday": bitrhday,
        "userCodeUI": userCodeUi,
      };
}

class BookingInvoice {
  BookingInvoice({
    this.invoiceId,
    this.invoice,
    this.subAmount=0,
    this.taxPorc=0,
    this.taxAmount=0,
    this.taxPorc1=0,
    this.taxAmount1=0,
    this.amount=0,
    this.typePayment,
    this.payment=0,
    this.dscto=0,
    this.vuelto = 0,
  });

  int? invoiceId;
  String? invoice;
  num? subAmount;
  num? taxPorc;
  num? taxAmount;
  num? taxPorc1;
  num? taxAmount1;
  num? amount;
  num? typePayment;
  num? payment;
  num? dscto;
  num? vuelto;

  factory BookingInvoice.fromJson(Map<String, dynamic> json) => BookingInvoice(
        invoiceId: json["invoiceID"],
        invoice: json["invoice"],
        subAmount: json["subAmount"],
        taxPorc: json["taxPorc"],
        taxAmount: json["taxAmount"],
        taxPorc1: json["taxPorc1"],
        taxAmount1: json["taxAmount1"],
        amount: json["amount"],
        typePayment: json["typePayment"],
        payment: json["payment"],
        dscto: json["dscto"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceID": invoiceId,
        "invoice": invoice,
        "subAmount": subAmount,
        "taxPorc": taxPorc,
        "taxAmount": taxAmount,
        "taxPorc1": taxPorc1,
        "taxAmount1": taxAmount1,
        "amount": amount,
        "typePayment": typePayment,
        "payment": payment,
        "dscto": dscto,
      };
}

class BookingPerson {
  BookingPerson({
    this.personId,
    this.personTypeId,
    this.documentTypeId,
    this.documentNumber,
    this.name,
    this.surname,
    this.secondSurname,
    this.phoneNumber,
    this.emailAddress,
    this.active,
  });

  int? personId;
  int? personTypeId;
  int? documentTypeId;
  String? documentNumber;
  String? name;
  String? surname;
  String? secondSurname;
  String? phoneNumber;
  String? emailAddress;
  bool? active;

  factory BookingPerson.fromJson(Map<String, dynamic> json) => BookingPerson(
        personId: json["personID"],
        personTypeId: json["personTypeID"],
        documentTypeId: json["documentTypeID"],
        documentNumber: json["documentNumber"],
        name: json["name"],
        surname: json["surname"],
        secondSurname: json["secondSurname"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "personID": personId,
        "personTypeID": personTypeId,
        "documentTypeID": documentTypeId,
        "documentNumber": documentNumber,
        "name": name,
        "surname": surname,
        "secondSurname": secondSurname,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "active": active,
      };
}
