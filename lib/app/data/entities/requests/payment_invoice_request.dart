import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_invoice_request.freezed.dart';
part 'payment_invoice_request.g.dart';

@freezed
class PaymentInvoiceRequest with _$PaymentInvoiceRequest {
  const factory PaymentInvoiceRequest({
    @JsonKey(name: 'typePayment') required String typePayment,
    @JsonKey(name: 'numberCard') required String numberCard,
    @JsonKey(name: 'numerOperation') required String numerOperation,
    @JsonKey(name: 'amount') required num amount,
  }) = _PaymentInvoiceRequest;

  factory PaymentInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentInvoiceRequestFromJson(json);
}
