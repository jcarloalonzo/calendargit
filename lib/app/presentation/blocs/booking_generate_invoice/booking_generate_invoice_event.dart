import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'booking_generate_invoice_state.dart';
import 'screen_model/booking_generate_invoice_screen_model.dart';

part 'booking_generate_invoice_event.freezed.dart';

@freezed
class BookingGenerateInvoiceEvent with _$BookingGenerateInvoiceEvent {
  const factory BookingGenerateInvoiceEvent.setError(
      {required ErrorModel? error}) = BookingGenerateInvoiceSetErrorEvent;
  const factory BookingGenerateInvoiceEvent.changeState(
          BookingGenerateInvoiceState state) =
      BookingGenerateInvoiceChangeStateEvent;

  const factory BookingGenerateInvoiceEvent.updateModel(
          {required BookingGenerateInvoiceScreenModel model}) =
      BookingGenerateInvoiceUpdateModelEvent;
}
