// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/Utils.dart';
import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../bloc/booking_bloc.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/confirm_alternate.dart';
import '../../widgets/confirm_at.dart';
import '../../widgets/my_buttom.dart';
import '../../widgets/my_loading_super.dart';
import '../../widgets/my_text.dart';
import '../../widgets/textfield_general.dart';
import '../navigator/background_navigator.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({Key? key}) : super(key: key);

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  final TextEditingController _priceFinalController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    try {
      Future.delayed(Duration.zero, () async {
        final blocBooking = Provider.of<BookingBloc>(context, listen: false);

        // if(blocBooking.bookingDetail!.completed!&&blocBooking.bookingDetail!.invoiceState!){

        // }

        _priceFinalController.text =
            (blocBooking.bookingDetail!.priceFinal!.toString());

        // if(blocBooking.bookingInvoice==null)
        _phoneController.text =
            (blocBooking.bookingDetail!.bookingClient!.phoneNumber ?? '');
        _emailController.text =
            (blocBooking.bookingDetail!.bookingClient!.emailAddress ?? '');

        _observationController.text =
            (blocBooking.bookingDetail!.observation ?? '');
        _paymentController.text =
            blocBooking.bookingDetail!.bookingInvoice!.payment.toString();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final blocBooking = Provider.of<BookingBloc>(context, listen: true);

    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          children: const [
            MyText(
              text: 'Datos de la reserva: ',
              color: Palette.blue1,
              fontWeight: FontWeight.w700,
              size: SizeText.text3 - 3,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: MyTextFieldContainer(
                controller: TextEditingController(
                    text: blocBooking.bookingDetail?.bookingCode),
                isEnabled: false,
                hintText: 'Código de reserva',
                title: 'Código de reserva',
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: MyTextFieldContainer(
                  title: 'Invoice',
                  isEnabled: false,
                  controller: TextEditingController(
                    text: (blocBooking.bookingDetail?.bookingInvoice != null)
                        ? blocBooking.bookingDetail?.bookingInvoice?.invoice
                        : '',
                  )),
            ),
          ],
        ),
        SizedBox(height: 10),
        MyTextFieldContainer(
          title: 'Servicio',
          isEnabled: false,
          controller: TextEditingController(
              text: blocBooking.bookingDetail?.serviceName),
        ),
        SizedBox(height: 10),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: MyTextFieldContainer(
                title: 'Fecha',
                isEnabled: false,
                controller: TextEditingController(
                    text: MyUtils.formatDate(
                        DateTime.parse(blocBooking.bookingDetail!.date!))),
              ),
            ),
            SizedBox(width: 56),
            Expanded(
              child: MyTextFieldContainer(
                title: 'Inicio - Fin',
                isEnabled: false,
                controller: TextEditingController(
                    text:
                        '${blocBooking.bookingDetail?.initialTime} - ${blocBooking.bookingDetail?.finalTime}'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: MyTextFieldContainer(
                title: 'Precio',
                isEnabled: false,
                controller: TextEditingController(
                    text:
                        MyUtils.formatPrice(blocBooking.bookingDetail!.price!)),
              ),
            ),
            SizedBox(width: 56),
            Expanded(
              child: MyTextFieldContainer(
                title: 'Precio Final',
                isEnabled: (blocBooking.onlyView!) ? false : true,
                prefix: MyText(
                  text: '\$. ',
                  color: Color(0xff223263),
                  fontWeight: FontWeight.bold,
                  size: 12,
                ),
                controller: _priceFinalController,
                onChanged: (v) =>
                    blocBooking.setAmount(v.isEmpty ? 0 : num.parse(v)),
                textInputType: TextInputType.numberWithOptions(decimal: false),
                onTapTextField: () {
                  _priceFinalController.clear();
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            MyText(
              text: 'Datos del cliente ',
              color: Palette.blue1,
              fontWeight: FontWeight.w700,
              size: SizeText.text3 - 3,
            ),
          ],
        ),
        SizedBox(height: 10),
        MyTextFieldContainer(
          title: 'Cliente',
          isEnabled: false,
          controller: TextEditingController(
              text:
                  '${blocBooking.bookingDetail?.bookingClient?.name} ${blocBooking.bookingDetail?.bookingClient?.surname ?? ''} ${blocBooking.bookingDetail?.bookingClient?.secondSurname ?? ''}  '),
        ),
        SizedBox(height: 10),
        MyTextFieldContainer(
          title: 'Telefono',
          isEnabled: (blocBooking.onlyView!) ? false : true,
          onChanged: (v) => blocBooking.setTelephone(v),
          controller: _phoneController,
        ),
        SizedBox(height: 10),
        MyTextFieldContainer(
          title: 'Email',
          isEnabled: (blocBooking.onlyView!) ? false : true,
          controller: _emailController,
          onChanged: (v) => blocBooking.setEmail(v),
        ),
        SizedBox(height: 10),
        Row(
          children: const [
            MyText(
              text: 'Datos adicionales ',
              color: Palette.blue1,
              fontWeight: FontWeight.w700,
              size: SizeText.text3 - 2,
            ),
          ],
        ),
        SizedBox(height: 10),
        MyTextFieldContainer(
          isEnabled: (blocBooking.onlyView!) ? false : true,
          title: 'Comentarios',
          controller: _observationController,
          hintText: 'Ingresa un comentario',
          onChanged: (v) => blocBooking.setObservation(v),
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       print(blocBooking.bookingInvoice?.payment);
        //       //
        //     },
        //     child: const Text('textasdads')),
        // ElevatedButton(
        //     onPressed: () {
        //       print(blocBooking.bookingDetail?.bookingClient?.emailAddress);
        //     },
        //     child: const Text('completed')),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: blocBooking.bookingDetail?.completed,
              onChanged: (blocBooking.onlyView!)
                  ? null
                  : (bool? v) {
                      blocBooking.checkBokCompleted = v;
                    },
            ),
            MyText(
              text: 'Reserva completada',
              size: SizeText.text3 - 2,
            ),
          ],
        ),
        if (blocBooking.bookingDetail!.completed!)
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: blocBooking.bookingDetail?.invoiceState,
                onChanged: (blocBooking.onlyView!)
                    ? null
                    : (bool? v) {
                        blocBooking.checkInvoiceState = v;
                      },
              ),
              MyText(
                text: 'Generar invoice',
                size: SizeText.text3 - 2,
              ),
            ],
          ),
        if (blocBooking.bookingDetail!.invoiceState!)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: blocBooking.typePayment,
                        onChanged: (blocBooking.onlyView!)
                            ? null
                            : (int? v) {
                                blocBooking.typePayment = v;
                              },
                      ),
                      MyText(
                        text: 'CASH',
                        size: SizeText.text4 - 1,
                      ),
                    ],
                  ),
                  //
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: blocBooking.typePayment,
                        onChanged: (blocBooking.onlyView!)
                            ? null
                            : (int? v) {
                                blocBooking.typePayment = v;
                              },
                      ),
                      MyText(
                        text: 'Tarjeta Credito',
                        size: SizeText.text4 - 1,
                      ),
                    ],
                  ),

                  //
                  //
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: blocBooking.typePayment,
                        onChanged: (blocBooking.onlyView!)
                            ? null
                            : (int? v) {
                                blocBooking.typePayment = v;
                              },
                      ),
                      MyText(
                        text: 'ZELLET',
                        size: SizeText.text4 - 1,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: MyTextFieldContainer(
                      isEnabled: (blocBooking.onlyView!) ? false : true,
                      title: 'Pago',
                      prefix: MyText(
                        text: '\$. ',
                        color: Color(0xff223263),
                        fontWeight: FontWeight.bold,
                        size: 12,
                      ),
                      controller: _paymentController,
                      textInputType:
                          TextInputType.numberWithOptions(decimal: false),
                      onTapTextField: () {
                        _paymentController.clear();
                      },
                      onChanged: (v) => blocBooking.setPayment(v),
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: MyTextFieldContainer(
                      title: 'Vuelto',
                      isEnabled: false,
                      controller: TextEditingController(
                          text: MyUtils.formatPrice(blocBooking.getVuelto())),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        MyText(
                          text: 'Sub Total',
                          size: SizeText.text4,
                        ),
                        SizedBox(height: 4),
                        MyText(
                          text: 'Tax',
                          size: SizeText.text4,
                        ),
                        SizedBox(height: 4),
                        MyText(
                          text: 'Total',
                          size: SizeText.text4,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: MyUtils.formatPrice(
                            blocBooking.bookingDetail!.bookingInvoice!.amount!),
                        size: SizeText.text4,
                      ),
                      SizedBox(height: 4),
                      MyText(
                        text: MyUtils.formatPrice(blocBooking
                            .bookingDetail!.bookingInvoice!.taxAmount!),
                        size: SizeText.text4,
                      ),
                      SizedBox(height: 4),
                      MyText(
                        text: MyUtils.formatPrice(
                            blocBooking.bookingDetail!.bookingInvoice!.amount!),
                        size: SizeText.text4,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        //
        SizedBox(
          height: 20,
        ), //

        if (!blocBooking.onlyView!)
          MyButtom(
            text: 'Confirmar',
            onTap: blocBooking.enableButtom!
                ? () => _openmodal(context, 'Reserva Online')
                : null,
          ),

        SizedBox(
          height: 50,
        ), //
        //
      ],
    ));
  }

  void _openmodal(BuildContext context, String tittle) {
    Future.delayed(Duration.zero, () async {
      ConfirmAlternant(context: context, action: () => _processconfirm(context))
          .confirmDialogBack(tittle, '¿Desea proceder con la confirmación?',
              '   NO   ', '    SI   ', 120.00);
    });
  }

  void _processconfirm(BuildContext context) async {
    final bloc = Provider.of<BookingBloc>(context, listen: false);
    final blocLogin = Provider.of<MainBloc>(context, listen: false);

    final myLoading = MyLoading(context);
    myLoading.createLoading();

    var response = await bloc.confirmButtom(blocLogin.model!);

    if (response.statusCode == 200) {
      Future.delayed(Duration.zero, () {
        ConfirmAt(
                context: context,
                action: () {
                  Navigator.popAndPushNamed(
                      context, BackGroundNavigator.routeName);
                },
                content: const ContentSucess(
                  text: 'Gracias por confirmar la reserva.',
                ))
            .confirmDialogBack('Registro Exitoso', 'Aceptar', 180,
                refresh: true);
      });
    }
    myLoading.dismiss();
  }
}
