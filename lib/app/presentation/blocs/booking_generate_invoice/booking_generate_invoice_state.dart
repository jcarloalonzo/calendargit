import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'screen_model/booking_generate_invoice_screen_model.dart';

part 'booking_generate_invoice_state.freezed.dart';

@freezed
class BookingGenerateInvoiceState with _$BookingGenerateInvoiceState {
  factory BookingGenerateInvoiceState.loading() =
      BookingGenerateInvoiceStateLoading;
  factory BookingGenerateInvoiceState.failed([String? failure]) =
      BookingGenerateInvoiceStateFailed;
  factory BookingGenerateInvoiceState.loaded({
    ErrorModel? error,
    required BookingGenerateInvoiceScreenModel model,
  }) = BookingGenerateInvoiceStateLoaded;
}
