import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../blocs/booking_generate_invoice/booking_generate_invoice_bloc.dart';
import '../../../blocs/booking_generate_invoice/screen_model/booking_generate_invoice_screen_model.dart';
import '../../../utils/masked_text_input_formatter.dart';
import 'popup_register_container_text_field.dart';

class BookingGenerateCardPaymentContainer extends StatefulWidget {
  const BookingGenerateCardPaymentContainer({
    super.key,
    required this.model,
  });
  final BookingGenerateInvoiceScreenModel model;

  @override
  State<BookingGenerateCardPaymentContainer> createState() =>
      _BookingGenerateCardPaymentContainerState();
}

class _BookingGenerateCardPaymentContainerState
    extends State<BookingGenerateCardPaymentContainer> {
  late TextEditingController _numberCardTextController;
  @override
  void initState() {
    _numberCardTextController = TextEditingController();
    initvalues();
    super.initState();
  }

  initvalues() {
    _numberCardTextController.text = widget.model.nroCard;
  }

  @override
  void dispose() {
    _numberCardTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SpaceHelpers.verticalVerySmall,
        RowContainerTextfield(
          title: texts.label.cardNumber,
          controller: _numberCardTextController,
          inputFormattes: [
            MaskedTextInputFormatter(
              mask: 'xxxx-xxxx-xxxx-xxxx',
              separator: '-',
            ),
          ],
          widthContainer: 180,
          onChanged: _onChangedNumberCard,
        ),
      ],
    );
  }

  void _onChangedNumberCard(String p1) {
    final bloc = context.read<BookingGenerateInvoiceBloc>();
    bloc.setNumberCard(p1);
  }
}
