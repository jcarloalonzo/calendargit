import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_invoice_response.freezed.dart';
part 'generate_invoice_response.g.dart';

@freezed
class GenerateInvoiceResponse with _$GenerateInvoiceResponse {
  const factory GenerateInvoiceResponse({
    @JsonKey(name: 'InvoiceID') required int invoiceId,
    @JsonKey(name: 'NumberID') required String numberId,
    @JsonKey(name: 'CodeNumber') required String codeNumber,
  }) = _GenerateInvoiceResponse;

  factory GenerateInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateInvoiceResponseFromJson(json);
}
