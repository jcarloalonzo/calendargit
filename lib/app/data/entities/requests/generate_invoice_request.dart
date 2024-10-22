import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_invoice_request.dart';

part 'generate_invoice_request.freezed.dart';
part 'generate_invoice_request.g.dart';

@freezed
class GenerateInvoiceRequest with _$GenerateInvoiceRequest {
  const factory GenerateInvoiceRequest({
    @JsonKey(name: 'User') required int user,
    @JsonKey(name: 'businessID') required int businessId,
    @JsonKey(name: 'businessIdent') required String businessIdent,
    @JsonKey(name: 'officeID') required int officeId,
    @JsonKey(name: 'subAmount') required num subAmount,
    @JsonKey(name: 'taxPorc') required num taxPorc,
    @JsonKey(name: 'taxAmount') required num taxAmount,
    @JsonKey(name: 'taxPorc1') required num taxPorc1,
    @JsonKey(name: 'taxAmount1') required num taxAmount1,
    @JsonKey(name: 'dscto') required num dscto,
    @JsonKey(name: 'amount') required num amount,
    @JsonKey(name: 'listPayment')
    required List<PaymentInvoiceRequest> listPayment,
  }) = _GenerateInvoiceRequest;

  factory GenerateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateInvoiceRequestFromJson(json);
}
