import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_config/size_text.dart';
import '../../../../config/app_config/space_helpers.dart';
import '../../../../config/helpers/helpers.dart';
import '../../../../generated/translations.g.dart';
import '../../../data/entities/responses/generate_invoice_response.dart';
import '../../../domain/models/base.dart';
import '../../blocs/booking_generate_invoice/booking_generate_invoice_bloc.dart';
import '../../blocs/booking_generate_invoice/screen_model/booking_generate_invoice_screen_model.dart';
import '../../widgets/my_buttom.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_text.dart';
import '../../widgets/util/loader.dart';
import '../navigator/navigator_page.dart';
import 'components/booking_generate_type_method_payment_container.dart';
import 'components/popup_register_container_text_field.dart';

class BookingGenerateInvoiceBody extends StatefulWidget {
  const BookingGenerateInvoiceBody({super.key, required this.model});
  final BookingGenerateInvoiceScreenModel model;

  @override
  State<BookingGenerateInvoiceBody> createState() =>
      _BookingGenerateInvoiceBodyState();
}

class _BookingGenerateInvoiceBodyState
    extends State<BookingGenerateInvoiceBody> {
  late TextEditingController taxTextController;
  late TextEditingController subTotalTextController;
  late TextEditingController dsctoTextController;

  @override
  void initState() {
    subTotalTextController = TextEditingController();
    taxTextController = TextEditingController();
    dsctoTextController = TextEditingController();
    super.initState();
    initValues();
  }

  initValues() {
    subTotalTextController.text = Helpers.formatPrice(widget.model.subTotal);
    taxTextController.text = Helpers.formatPrice(widget.model.tax);
    dsctoTextController.text = Helpers.formatPrice(0);
  }

  @override
  void dispose() {
    subTotalTextController.dispose();
    taxTextController.dispose();
    dsctoTextController.dispose();
    super.dispose();
  }

  BookingGenerateInvoiceScreenModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          MyCardContainer(
            child: Column(
              children: <Widget>[
                RowContainerTextfield(
                  title: 'Sub total',
                  hintText: Helpers.formatPrice(0),
                  isEditable: false,
                  controller: subTotalTextController,
                ),
                RowContainerTextfield(
                  title: 'Tax',
                  isEditable: false,
                  controller: taxTextController,
                  hintText: Helpers.formatPrice(0),
                ),
                RowContainerTextfield(
                  title: 'Dscto',
                  hintText: Helpers.formatPrice(0),
                  controller: dsctoTextController,
                  onChanged: _onChangedDscto,
                ),
                RowContainerTextfield(
                  isEditable: false,
                  title: 'Total',
                  controller: TextEditingController(
                      text: Helpers.formatPrice(context.select(
                    (BookingGenerateInvoiceBloc value) => value.getTotal(),
                  ))),
                  hintText: Helpers.formatPrice(0),
                ),
                Divider(),
                Card(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Base>(
                        isDense: true,
                        value: widget.model.methodPayment,
                        onChanged: (Base? value) {
                          context
                              .read<BookingGenerateInvoiceBloc>()
                              .setPaymentMethod(value!);
                        },
                        items: widget.model.methodPayments.map((Base data) {
                          return DropdownMenuItem(
                            value: data,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                MyText(
                                  data.label,
                                  size: SizeText.text5 - 1,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SpaceHelpers.verticalNormal,
                BookinGenerateTypeMethodPaymentContainer(model: widget.model)
              ],
            ),
          ),
          SpaceHelpers.verticalVeryLong,
          MyButtom(
            texts.label.generateInvoice,
            onTap: () => _onTapGenerateInvoice(context),
          ),
        ],
      ),
    );
  }

  void _onChangedDscto(String p1) async {
    final bloc = context.read<BookingGenerateInvoiceBloc>();
    final num? value = p1.trim().isEmpty ? 0 : num.tryParse(p1);
    if (value == null) {
      dsctoTextController.clear();
      bloc.setError(texts.messages.youMustEnterAValidValue);
      await Future.delayed(Duration(milliseconds: 300));
      bloc.setDscto(0);
      return;
    }

    if (value > widget.model.subTotal) {
      dsctoTextController.clear();
      bloc.setError(
          texts.messages.youCannotEnterADiscountGreaterThanTheSubtotal);
      await Future.delayed(Duration(milliseconds: 300));
      bloc.setDscto(0);
      return;
    }
    bloc.setDscto(value);
  }

  void _onTapGenerateInvoice(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<BookingGenerateInvoiceBloc>();
    final GenerateInvoiceResponse? response =
        await Loader.showLoader(context, bloc.generateInvoice());
    if (!context.mounted) return;
    if (response == null) return;
    context.go(NavigatorPage.route);
  }
}
