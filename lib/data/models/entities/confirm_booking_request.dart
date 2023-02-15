// To parse this JSON data, do
//
//     final confirmBookingRequest = confirmBookingRequestFromJson(jsonString);

import 'dart:convert';

ConfirmBookingRequest confirmBookingRequestFromJson(String str) =>
    ConfirmBookingRequest.fromJson(json.decode(str));

String confirmBookingRequestToJson(ConfirmBookingRequest data) =>
    json.encode(data.toJson());

class ConfirmBookingRequest {
  ConfirmBookingRequest({
    this.authorizedUser,
    this.businessId,
    this.businessIdent,
    this.officeId,
    this.completed,
    this.invoice,
    this.priceFinal,
    this.comment,
    this.telephone,
    this.emailAddress,
    this.subAmount,
    this.taxPorc,
    this.taxAmount,
    this.taxPorc1,
    this.taxAmount1,
    this.amount,
    this.typePayment,
    this.payment,
    this.dscto,
  });

  
  int? authorizedUser;
  int? businessId;
  String? businessIdent;
  int? officeId;
  bool? completed;
  bool? invoice;
  num? priceFinal;
  String? comment;
  String? telephone;
  String? emailAddress;
  num? subAmount;
  num? taxPorc;
  num? taxAmount;
  num? taxPorc1;
  num? taxAmount1;
  num? amount;
  num? typePayment;
  num? payment;
  num? dscto;

  factory ConfirmBookingRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmBookingRequest(
        authorizedUser: json["AuthorizedUser"],
        businessId: json["businessID"],
        businessIdent: json["businessIdent"],
        officeId: json["officeID"],
        completed: json["completed"],
        invoice: json["invoice"],
        priceFinal: json["priceFinal"],
        comment: json["comment"],
        telephone: json["telephone"],
        emailAddress: json["emailAddress"],
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
        "AuthorizedUser": authorizedUser,
        "businessID": businessId,
        "businessIdent": businessIdent,
        "officeID": officeId,
        "completed": completed,
        "invoice": invoice,
        "priceFinal": priceFinal,
        "comment": comment,
        "telephone": telephone,
        "emailAddress": emailAddress,
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
