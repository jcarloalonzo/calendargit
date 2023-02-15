import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/dropdown_model.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/agent/agent_cancel/agent_cancel_page.dart';
import 'package:calendario/presentation/pages/agent/agent_complet/agent_complete_page.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_page.dart';
import 'package:calendario/presentation/pages/schedule/schedule_widgets.dart';
import 'package:calendario/presentation/widgets/my_alerts.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:calendario/presentation/widgets/textfield_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../data/models/entities/booking.dart';

class ScheduleMethods {
  static Future<DialogsAlerts?> toInvoiceMethod(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            elevation: 20,
            insetPadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              color: Palette.colorApp,
              height: 40,
              width: double.infinity,
              child: const MyText(
                fontWeight: FontWeight.w700,
                size: SizeText.text4,
                color: Palette.white,
                text: 'Finalizar la venta',
              ),
            ),
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var width = MediaQuery.of(context).size.width * 0.8;

                return _MyDialogSave(
                  width: width,
                );
                // return _MyDialogSave(
                //   height: height,
                //   width: width,
                // );
              },
            ),
          );
        });
  }

//
//
//

  static Future<dynamic> infoMethod(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          elevation: 20,
          actionsPadding: EdgeInsets.zero,
          actionsOverflowButtonSpacing: 0,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              return SizedBox(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Palette.colorApp,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(width: 10),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const MyText(
                              textAlign: TextAlign.center,
                              text: 'Información',
                              color: Palette.white,
                              size: SizeText.text5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Palette.white,
                            ),
                            onPressed: () =>
                                Navigator.of(context).pop(DialogsAlerts.abort),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: Palette.statusxconfirmar,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: MyText(
                            fontWeight: FontWeight.w400,
                            text: 'Cita Pendiente',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: Palette.statuscancelada,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: MyText(
                            fontWeight: FontWeight.w400,
                            text: 'Cita Anulada',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: Palette.statuscompletada,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: MyText(
                            fontWeight: FontWeight.w400,
                            text: 'Cita Completada',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: Palette.statusReprogramada,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: MyText(
                            fontWeight: FontWeight.w400,
                            text: 'Cita Reprogramada',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: Palette.statusinvoice,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: MyText(
                            fontWeight: FontWeight.w400,
                            text: 'Cita Facturada',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  //
  //

  static Future<dynamic> dialogEditSchedule(BuildContext context, Booking obj) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: false);

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          elevation: 20,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                padding: const EdgeInsets.all(15),
                height: height * 0.23,
                width: width * 0.5,
                // obj: invoiceDet,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                              child: ItemTextColumn(
                            title: 'Reprogramar Cita',
                            colorIcon: Palette.blue1,
                            icono: (Icons.compare_arrows),
                            onTap: () async {
                              bloc.initProgram(bookingObj: obj);

                              bool valida = await bloc.validaReprogram(
                                  bookingID: obj.bookingId!);

                              Navigator.pop(context);

                              if (valida) {
                                bloc.setServiceID = obj.serviceId;
                                Navigator.pushNamed(
                                    context, AgentReproPage.routeName);
                              }
                            },
                          )),
                          Expanded(
                            child: ItemTextColumn(
                              title: 'Cancelar Cita',
                              colorIcon: Palette.statuscancelada,
                              icono: (Icons.cancel),
                              onTap: () {
                                bloc.initProgram(bookingObj: obj);

                                Navigator.pushNamed(
                                    context, AgentCancelDetailPage.routeName);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: Center(
                        child: ItemTextColumn(
                          title: 'Completar Cita',
                          colorIcon: Palette.green2,
                          icono: Icons.check_sharp,
                          onTap: () {
                            bloc.initProgram(
                              bookingObj: obj,
                            );
                            Navigator.pushNamed(
                                context, AgentCompletePage.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  //
  //
  //
  //

  static Future<DialogsAlerts?> filterMethodSchedule(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            elevation: 20,
            insetPadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              color: Palette.colorApp,
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    fontWeight: FontWeight.w700,
                    size: SizeText.text5,
                    color: Palette.white,
                    text: 'Filtrar',
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Palette.white),
                    onPressed: () {
                      Navigator.of(context).pop(DialogsAlerts.abort);
                    },
                  ),
                ],
              ),
            ),
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return const _MyDialogFilter();
              },
            ),
          );
        });
  }

  //
  //
  //
  //
  //
  // CANCELACION BOOKIGN

  static Future<DialogsAlerts?> cancelacionBookingMethod(
      {required BuildContext context, String? title, String? body}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (context) {
          return AlertDialog(
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            elevation: 20,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Column(
              children: [
                const SizedBox(height: 10),
                MyText(
                  text: title ?? '',
                  color: Palette.blue,
                  textAlign: TextAlign.center,
                  size: SizeText.text5,
                  fontWeight: FontWeight.w800,
                ),
                const Divider(color: Palette.blue, thickness: 0.9),
              ],
            ),
            titlePadding: EdgeInsets.zero,
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return _MyDialogCancelacionBooking(
                  body: body,
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogsAlerts.abort);
                },
                child: const MyText(
                  text: 'NO',
                  fontWeight: FontWeight.w800,
                  color: Palette.blue,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogsAlerts.yes);
                },
                child: const MyText(
                  text: 'SI',
                  fontWeight: FontWeight.w800,
                  color: Palette.blue,
                ),
              ),
            ],
          );
        });
  }
}

//
//

//
//

class _MyDialogFilter extends StatefulWidget {
  const _MyDialogFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<_MyDialogFilter> createState() => _MyDialogFilterState();
}

class _MyDialogFilterState extends State<_MyDialogFilter> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);
    return SizedBox(
      width: 100,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 07),
                  Card(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<TypeStateBookingDropDown>(
                          isDense: true,
                          value: bloc.typeStateBookingDropDown,
                          onChanged: (TypeStateBookingDropDown? value) {
                            bloc.typeStateBookingDropDown = value!;
                          },
                          items: typeStatesDropDown
                              .map((TypeStateBookingDropDown data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyText(
                                    text: data.descripcion,
                                    size: SizeText.text5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(
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
                  MyButtom(
                    text: 'Buscar',
                    colorText: Palette.white,
                    sizeText: SizeText.text5,
                    height: 35,
                    color: Palette.green2,
                    onTap: (!bloc.isLoading)
                        ? () async {
                            Navigator.of(context).pop(DialogsAlerts.yes);
                          }
                        : null,
                  ),
                  const SizedBox(height: 07),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyDialogCancelacionBooking extends StatefulWidget {
  final String? body;
  const _MyDialogCancelacionBooking({
    Key? key,
    this.body,
  }) : super(key: key);

  @override
  State<_MyDialogCancelacionBooking> createState() =>
      _MyDialogCancelacionBookingState();
}

class _MyDialogCancelacionBookingState
    extends State<_MyDialogCancelacionBooking> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);
    return SizedBox(
      width: 100,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 07),
                  const MyText(text: 'Motivo', color: Palette.grey4),
                  Card(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<TipoCancelacionDrop>(
                          isDense: true,
                          value: bloc.tipoCancelacionSelected,
                          onChanged: (TipoCancelacionDrop? value) {
                            bloc.tipoCancelacionSelected = value!;
                          },
                          items: tiposCancelacionesDrop
                              .map((TipoCancelacionDrop data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyText(
                                    text: data.descripcion,
                                    size: SizeText.text5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(
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
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: MyText(
                      text: widget.body ?? '',
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      color: Palette.blue,
                      size: SizeText.text5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // MyButtom(
                  //   text: 'Buscar',
                  //   colorText: Palette.white,
                  //   sizeText: SizeText.text5,
                  //   height: 35,
                  //   color: Palette.green2,
                  //   onTap: (!bloc.isLoading)
                  //       ? () async {
                  //           Navigator.of(context).pop(DialogsAlerts.yes);
                  //         }
                  //       : null,
                  // ),
                  const SizedBox(height: 07),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//

class _MyDialogSave extends StatefulWidget {
  const _MyDialogSave({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<_MyDialogSave> createState() => _MyDialogSaveState();
}

class _MyDialogSaveState extends State<_MyDialogSave> {
  final TextEditingController _descuentoController = TextEditingController();
  final TextEditingController _pagoController = TextEditingController();
  final TextEditingController _nroTarjetaController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final bloc = Provider.of<ScheduleBloc>(context, listen: false);

      _descuentoController.text = 0.toString();
      // _pagoController.text = productService.totalFinal.toString();
      _pagoController.text = bloc.bookingSeleccionado!.price!.toString();
      _nroTarjetaController.text = '';
    });
  }

  @override
  void dispose() {
    super.dispose();

    _descuentoController.dispose();
    _pagoController.dispose();
    _nroTarjetaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return SizedBox(
      // height: height,
      width: widget.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const MySizedBoxHeight(kDouble: 15),
                  _ItemTextWithTextField(
                    title: 'Sub Total',
                    isEnabled: false,
                    isEditableColor: true,
                    controller: TextEditingController(
                        text: (bloc.bookingSeleccionado!.price.toString())),
                  ),
                  const MySizedBoxHeight(kDouble: 10),
                  _ItemTextWithTextField(
                    title: 'Tax',
                    isEnabled: false,
                    isEditableColor: true,
                    controller: TextEditingController(text: (0.toString())),
                  ),
                  const MySizedBoxHeight(kDouble: 10),
                  _ItemTextWithTextField(
                    title: 'Dscto',
                    hintText: '0',
                    isEnabled: true,
                    isEditableColor: false,
                    onTapTextField: () {
                      // bloc.setDescuentoInvoice(v: num.parse('0'));
                    },
                    controller: _descuentoController,
                    onChanged: (value) {
                      num x = num.parse(value.isNotEmpty ? value : '0');
                      if (x <= bloc.bookingSeleccionado!.price!) {
                        bloc.setDescuentoInvoice(v: x);
                      } else {
                        bloc.setDescuentoInvoice(
                            v: bloc.bookingSeleccionado!.price!);
                        _descuentoController.text =
                            bloc.bookingSeleccionado!.price!.toString();
                      }
                    },
                  ),
                  const MySizedBoxHeight(kDouble: 10),
                  _ItemTextWithTextField(
                    title: 'Total',
                    isEditableColor: true,
                    isEnabled: false,
                    controller: TextEditingController(
                      text: bloc.getTotalInvoice().toString(),
                    ),
                  ),
                  const Divider(thickness: 1.1, color: Palette.black),
                  Card(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<TipoPagoModelDropDown>(
                          isDense: true,
                          value: bloc.tipoPagoSelected,
                          onChanged: (TipoPagoModelDropDown? value) {
                            bloc.setPagoInvoice(v: bloc.getTotalInvoice());

                            bloc.setNumeroTarjeta('');
                            _nroTarjetaController.clear();
                            bloc.tipoPagoSelected = value!;
                          },
                          items:
                              tipoPagoModels.map((TipoPagoModelDropDown data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyText(
                                    text: data.descripcion,
                                    size: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const MySizedBoxHeight(kDouble: 10),

                  if (bloc.tipoPagoSelected.cod == 1)
                    Column(
                      children: [
                        _ItemTextWithTextField(
                          title: 'Pago',
                          hintText: '0',
                          controller: _pagoController,
                          isEditableColor: false,
                          isEnabled: true,
                          onTapTextField: () {
                            // _pagoController.clear();

                            // productService.setPago(v: int.parse('0'));
                          },
                          onChanged: (value) {
                            num x = num.parse(value.isNotEmpty ? value : '0');

                            if (x <= bloc.getTotalInvoice()) {
                              bloc.setPagoInvoice(v: x);
                            } else {
                              bloc.setPagoInvoice(v: bloc.getTotalInvoice());
                              _pagoController.text =
                                  bloc.getTotalInvoice().toString();
                            }
                          },
                        ),
                        const MySizedBoxHeight(kDouble: 10),
                        _ItemTextWithTextField(
                          title: 'Vuelto',
                          isEditableColor: true,
                          isEnabled: false,
                          controller: TextEditingController(
                            text: bloc.getVueltoInvoice().toString(),
                          ),
                          // controller: TextEditingController(
                          // text: (productService.vuelto.toString())),
                        ),
                      ],
                    ),

                  if (bloc.tipoPagoSelected.cod == 2)
                    Column(
                      children: [
                        // Card(
                        //   child: Container(
                        //     height: 40,
                        //     padding: EdgeInsets.symmetric(horizontal: 10),
                        //     width: double.infinity,
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton<TipoTarjetaModelDropDown>(
                        //         isDense: true,
                        //         value: bloc.tipoTarjetaSelected,
                        //         onChanged: (TipoTarjetaModelDropDown? value) {
                        //           bloc.tipoTarjetaSelected = value!;
                        //         },
                        //         items: tipoTarjetaModels
                        //             .map((TipoTarjetaModelDropDown data) {
                        //           return DropdownMenuItem(
                        //             value: data,
                        //             child: Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: <Widget>[
                        //                 MyText(
                        //                   text: data.descripcion,
                        //                   size: 15,
                        //                   fontWeight: FontWeight.w900,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 10,
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //         }).toList(),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        _ItemTextWithTextField(
                          isPrice: false,
                          isEnabled: true,
                          isEditableColor: false,
                          title: 'Nro de Tarjeta',
                          hintText: '4444-4444-4444-4444',
                          controller: _nroTarjetaController,
                          onChanged: (v) {
                            if (v.isNotEmpty) {
                              bloc.setNumeroTarjeta(v);
                            }
                          },
                          inputFormatters: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx-xxxx-xxxx-xxxx',
                              separator: '-',
                            ),
                          ],
                          widthField: 150,
                        ),
                      ],
                    ),
                  //
                  //
                  //
                  //
                  Row(
                    children: [
                      Switch(
                        activeColor: Palette.green,
                        splashRadius: 11,
                        value: bloc.imprimeInvoice!,
                        onChanged: (value) {
                          bloc.imprimeInvoice = value;
                        },
                      ),
                      const MyText(
                          text: 'Imprimir invoice',
                          fontWeight: FontWeight.w700,
                          color: Palette.grey4)
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: MyButtom(
                          color: Palette.red,
                          colorText: Palette.white,
                          text: 'Cancelar',
                          onTap: () {
                            Navigator.of(context).pop(DialogsAlerts.abort);
                          },
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: MyButtom(
                          text: 'Guardar',
                          colorText: Palette.white,
                          color: Palette.green2,
                          onTap: () async {
                            // String? valida = await bloc.guardaFacturaService(
                            //     companyService.companySeleccionado!,
                            //     productService);
                            Navigator.of(context).pop(DialogsAlerts.yes);
                            // ToInvoiceResponse? resp =
                            //     await bloc.generateInvoiceBooking();

                            // Navigator.pop(context);

                            // if (valida != null) {
                            //   // bloc.limpiaNewInvoice();

                            //   // await bloc.initNewInvoice();
                            //   companyService.limpiarNombreCompany();
                            //   productService.disposeNewInvoice();
                            //   Navigator.pop(context);

                            //   return MyAlerts.sucess(
                            //       context: context,
                            //       body:
                            //           'Se emitio el invoice INV-$valida de forma correcta.');
                            //   // if (action == DialogAction.yes) {
                            //   //   Navigator.pop(context);
                            //   // }
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemTextWithTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool isEnabled;
  final double widthField;
  final bool isPrice;
  final bool isEditableColor;
  final Function(String)? onChanged;
  final Function()? onTapTextField;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  const _ItemTextWithTextField({
    Key? key,
    required this.title,
    this.controller,
    this.isEnabled = true,
    this.widthField = 150,
    this.isPrice = true,
    this.isEditableColor = true,
    this.onChanged,
    this.onTapTextField,
    this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: title,
          fontWeight: FontWeight.w800,
          color: Palette.gray1,
        ),
        Row(
          children: [
            if (isPrice)
              const MyText(
                text: '\$.',
                color: Palette.gray1,
                fontWeight: FontWeight.w700,
              ),
            MyTextFieldContainer(
              inputFormatters: inputFormatters,
              widthContainer: widthField,
              controller: controller,
              isEnabled: isEnabled,
              hintText: hintText,
              isObscure: isEditableColor,
              onTapTextField: onTapTextField,
              onChanged: onChanged,
              textInputType: TextInputType.number,
              onTap: () {
                // Navigator.pushNamed(context, CompanyPage.routeName,
                //     arguments: OnlyPickArguments(onlyPick: true));
              },
            ),
          ],
        ),
      ],
    );
  }
}
