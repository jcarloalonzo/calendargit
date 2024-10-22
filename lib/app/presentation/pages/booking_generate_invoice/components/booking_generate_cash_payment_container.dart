import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../config/helpers/helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../blocs/booking_generate_invoice/booking_generate_invoice_bloc.dart';
import '../../../blocs/booking_generate_invoice/screen_model/booking_generate_invoice_screen_model.dart';
import 'popup_register_container_text_field.dart';

class BookingGenerateCashPaymentContainer extends StatefulWidget {
  const BookingGenerateCashPaymentContainer({
    super.key,
    required this.model,
  });
  final BookingGenerateInvoiceScreenModel model;

  @override
  State<BookingGenerateCashPaymentContainer> createState() =>
      _BookingGenerateCashPaymentContainerState();
}

class _BookingGenerateCashPaymentContainerState
    extends State<BookingGenerateCashPaymentContainer> {
  late TextEditingController _paymentTextController;
  @override
  void initState() {
    _paymentTextController = TextEditingController();
    super.initState();
    initValues();
  }

  initValues() {
//
    _paymentTextController.text = Helpers.formatPrice(widget.model.cash);
  }

  @override
  void dispose() {
    _paymentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RowContainerTextfield(
          title: texts.label.payment,
          controller: _paymentTextController,
          hintText: Helpers.formatPrice(0),
          onChanged: _onChangedPayment,
        ),
        SpaceHelpers.verticalVerySmall,
        RowContainerTextfield(
          isEditable: false,
          controller: TextEditingController(
              text: context.select(
            (BookingGenerateInvoiceBloc bloc) =>
                Helpers.formatPrice(bloc.getVuelto()),
          )),
          title: texts.label.balance,
        ),
      ],
    );
  }

  void _onChangedPayment(String p1) async {
    final bloc = context.read<BookingGenerateInvoiceBloc>();
    final num? value = p1.trim().isEmpty ? 0 : num.tryParse(p1);
    if (value == null) {
      _paymentTextController.clear();
      bloc.setError(texts.messages.youMustEnterAValidValue);
      await Future.delayed(Duration(milliseconds: 300));
      bloc.setPaymentAmount(0);
      return;
    }

    bloc.setPaymentAmount(value);
    //
  }
}
