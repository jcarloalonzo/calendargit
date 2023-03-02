// To parse this JSON data, do
//
//     final generateInvoiceBookingRequest = generateInvoiceBookingRequestFromJson(jsonString);

import 'dart:convert';

GenerateInvoiceBookingRequest generateInvoiceBookingRequestFromJson(
        String str) =>
    GenerateInvoiceBookingRequest.fromJson(json.decode(str));

String generateInvoiceBookingRequestToJson(
        GenerateInvoiceBookingRequest data) =>
    json.encode(data.toJson());

class GenerateInvoiceBookingRequest {
  GenerateInvoiceBookingRequest({
    this.user,
    this.businessId,
    this.businessIdent,
    this.officeId,
    this.subAmount,
    this.taxPorc,
    this.taxAmount,
    this.taxPorc1,
    this.taxAmount1,
    this.dscto,
    this.amount,
    this.listPayment,
  });
  factory GenerateInvoiceBookingRequest.fromJson(Map<String, dynamic> json) =>
      GenerateInvoiceBookingRequest(
        user: json['User'],
        businessId: json['businessID'],
        businessIdent: json['businessIdent'],
        officeId: json['officeID'],
        subAmount: json['subAmount'],
        taxPorc: json['taxPorc'],
        taxAmount: json['taxAmount'],
        taxPorc1: json['taxPorc1'],
        taxAmount1: json['taxAmount1'],
        dscto: json['dscto'],
        amount: json['amount'],
        listPayment: List<ListPaymentRequest>.from(
            json['listPayment'].map((x) => ListPaymentRequest.fromJson(x))),
      );

  int? user;
  int? businessId;
  String? businessIdent;
  int? officeId;
  num? subAmount;
  num? taxPorc;
  num? taxAmount;
  num? taxPorc1;
  num? taxAmount1;
  num? dscto;
  num? amount;
  List<ListPaymentRequest>? listPayment;

  Map<String, dynamic> toJson() => {
        'User': user,
        'businessID': businessId,
        'businessIdent': businessIdent,
        'officeID': officeId,
        'subAmount': subAmount,
        'taxPorc': taxPorc,
        'taxAmount': taxAmount,
        'taxPorc1': taxPorc1,
        'taxAmount1': taxAmount1,
        'dscto': dscto,
        'amount': amount,
        'listPayment': List<dynamic>.from(listPayment!.map((x) => x.toJson())),
      };
}

class ListPaymentRequest {
  ListPaymentRequest({
    this.typePayment,
    this.numberCard,
    this.numerOperation,
    this.amount,
  });
  factory ListPaymentRequest.fromJson(Map<String, dynamic> json) =>
      ListPaymentRequest(
        typePayment: json['typePayment'],
        numberCard: json['numberCard'],
        numerOperation: json['numerOperation'],
        amount: json['amount'],
      );

  String? typePayment;
  String? numberCard;
  String? numerOperation;
  num? amount;

  Map<String, dynamic> toJson() => {
        'typePayment': typePayment,
        'numberCard': numberCard,
        'numerOperation': numerOperation,
        'amount': amount,
      };
}
