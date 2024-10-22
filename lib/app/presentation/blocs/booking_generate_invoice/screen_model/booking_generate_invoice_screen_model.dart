import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/base.dart';
import '../../../../domain/models/booking.dart';

part 'booking_generate_invoice_screen_model.freezed.dart';

@freezed
class BookingGenerateInvoiceScreenModel
    with _$BookingGenerateInvoiceScreenModel {
  const factory BookingGenerateInvoiceScreenModel({
    required Booking booking,
    required List<Base> methodPayments,
    required Base methodPayment,
    @Default(0) num subTotal,
    @Default(0) num tax,
    @Default(0) num dscto,
    @Default(0) num cash,
    @Default('') String nroCard,
  }) = _BookingGenerateInvoiceScreenModel;
}
