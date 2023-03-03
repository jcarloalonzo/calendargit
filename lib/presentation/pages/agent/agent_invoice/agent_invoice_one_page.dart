import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../bloc/schedule_bloc.dart';
import '../../../widgets/confirm_alternate.dart';
import '../../../widgets/confirm_at.dart';
import '../../../widgets/my_background_with_buttons.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../navigator/background_navigator.dart';
import 'agent_invoice_two_page.dart';

class AgentInvoiceOnePage extends StatefulWidget {
  const AgentInvoiceOnePage({Key? key}) : super(key: key);
  static String routeName = '/agentInvoiceOnePage';

  @override
  State<AgentInvoiceOnePage> createState() => _AgentInvoiceOnePageState();
}

class _AgentInvoiceOnePageState extends State<AgentInvoiceOnePage> {
  final TextEditingController _comentariosController = TextEditingController();
  final TextEditingController _precioFinalController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final bloc = Provider.of<ScheduleBloc>(context, listen: false);
      _precioFinalController.text =
          (bloc.bookingSeleccionado!.price).toString();
      //

      //
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return MyBackGroundWithButtons(
      bottomExpanded: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: MyButtom(
            text: 'GENERAR',
            color: Palette.blue,
            onTap: () {
//
              Navigator.pushNamed(context, AgentInvoiceTwoPage.routeName);
//
            }),
      ),
      titleAppBar: 'EMITIR INVOICE PASO 1',
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [
                MyText(
                  text: 'Datos de la reserva',
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Codigo reserva',
                    isEnabled: false,
                    controller: TextEditingController(
                        text: bloc.bookingSeleccionado?.bookingCode ?? ''),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Invoice',
                    isEnabled: false,
                    controller: TextEditingController(
                        text: bloc.bookingSeleccionado?.bookingCode ?? ''),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Servicio',
              isEnabled: false,
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.serviceDescription ?? ''),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Fecha',
                    isEnabled: false,
                    controller: TextEditingController(
                        text: (MyUtils.formatDate(
                                bloc.bookingSeleccionado!.date!))
                            .toString()),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Inicio - Fin ',
                    isEnabled: false,
                    controller: TextEditingController(
                        text:
                            '${bloc.bookingSeleccionado?.initialTime} - ${bloc.bookingSeleccionado?.finalTime}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Precio',
                    isEnabled: false,
                    controller: TextEditingController(
                        text: MyUtils.formatPrice(
                                bloc.bookingSeleccionado!.price!)
                            .toString()),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MyTextFieldContainer(
                    title: 'Precio Final',
                    prefix: const MyText(
                      text: '\$',
                      color: Palette.blue,
                    ),
                    controller: _precioFinalController,
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: const [
                MyText(
                  text: 'Datos del cliente',
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Cliente',
              isEnabled: false,
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.name ?? ''),
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Telefono',
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.phoneNumber ?? ''),
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Email',
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.emailAddress ?? ''),
            ),
            const SizedBox(height: 14),
            Row(
              children: const [
                MyText(
                  text: 'Datos Adicionales',
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Comentarios',
              controller: _comentariosController,
            ),
          ],
        ),
      ),
    );
  }

  void _openmodal(BuildContext context, String tittle) {
    Future.delayed(Duration.zero, () async {
      ConfirmAlternant(context: context, action: () => _processconfirm(context))
          .confirmDialogBack(tittle, '¿Está seguro de completar la reserva?',
              '   CANCELAR   ', '    SI   ', 120.00);
    });
  }

  void _processconfirm(BuildContext context) async {
    final bloc = Provider.of<ScheduleBloc>(context, listen: false);

    final myLoading = MyLoading(context);
    myLoading.createLoading();

    var response = await bloc.completeBooking();
    // comentario: _comentariosController.text,
    // priceFinal: _precioFinalController.text);

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
