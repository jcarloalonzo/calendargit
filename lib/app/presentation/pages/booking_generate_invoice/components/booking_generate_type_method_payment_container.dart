import 'package:flutter/material.dart';

import '../../../blocs/booking_generate_invoice/screen_model/booking_generate_invoice_screen_model.dart';
import 'booking_generate_card_payment_container.dart';
import 'booking_generate_cash_payment_container.dart';

class BookinGenerateTypeMethodPaymentContainer extends StatelessWidget {
  const BookinGenerateTypeMethodPaymentContainer({
    super.key,
    required this.model,
  });

  final BookingGenerateInvoiceScreenModel model;

  @override
  Widget build(BuildContext context) {
    // "Card" => Id 2
    if (model.methodPayment.id == 2) {
      return BookingGenerateCardPaymentContainer(model: model);
    }
    return BookingGenerateCashPaymentContainer(model: model);
  }
}
