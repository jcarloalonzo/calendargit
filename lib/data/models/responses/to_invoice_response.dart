// To parse this JSON data, do
//
//     final toInvoiceResponse = toInvoiceResponseFromJson(jsonString);

import 'dart:convert';

ToInvoiceResponse toInvoiceResponseFromJson(String str) =>
    ToInvoiceResponse.fromJson(json.decode(str));

String toInvoiceResponseToJson(ToInvoiceResponse data) =>
    json.encode(data.toJson());

class ToInvoiceResponse {
  ToInvoiceResponse({
    this.invoiceId,
    this.numberId,
    this.codeNumber,
  });

  int? invoiceId;
  String? numberId;
  String? codeNumber;

  factory ToInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      ToInvoiceResponse(
        invoiceId: json["InvoiceID"],
        numberId: json["NumberID"],
        codeNumber: json["CodeNumber"],
      );

  Map<String, dynamic> toJson() => {
        "InvoiceID": invoiceId,
        "NumberID": numberId,
        "CodeNumber": codeNumber,
      };
}
