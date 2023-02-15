import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/navigator/background_navigator.dart';
import 'package:calendario/presentation/widgets/my_loading_super.dart';
import 'package:calendario/presentation/widgets/my_alerts.dart';
import 'package:calendario/presentation/widgets/my_background_with_buttons.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:calendario/presentation/widgets/my_dialogs.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/textfield_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgentCompletePage extends StatefulWidget {
  static String routeName = "/agentCompletPage";

  const AgentCompletePage({Key? key}) : super(key: key);

  @override
  State<AgentCompletePage> createState() => _AgentCompletePageState();
}

class _AgentCompletePageState extends State<AgentCompletePage> {
  final TextEditingController _comentariosController = TextEditingController();
  final TextEditingController _precioFinalController = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final agendaBloc = Provider.of<ScheduleBloc>(context, listen: false);
      _precioFinalController.text =
          (agendaBloc.bookingSeleccionado!.price).toString();
      //

      //
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return MyBackGroundWithButtons(
      titleAppBar: 'Completar Reserva',
      bottomExpanded: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: MyButtom(
            text: 'COMPLETAR',
            color: Palette.statuscompletada,
            onTap: () async {
              // Navigator.pushNamed(context, AgentCompletePage.routeName);

              final action = await MyDialogs.yesAbortDialog(
                  context: context,
                  title: 'Completar Reserva',
                  body:
                      'Completar reserva ${bloc.bookingSeleccionado!.bookingCode}');

              if (action == DialogAction.yes) {
                // print('yes');
                return _processconfirm(context);
              }

              // _openmodal(context,
              //     'Completar reserva ${bloc.bookingSeleccionado!.bookingCode}');
            }),
      ),
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
            MyTextFieldContainer(
              title: 'Codigo reserva',
              isEnabled: false,
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.bookingCode ?? ''),
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
                        text:
                            (MyUtils.formatDate(bloc.bookingSeleccionado!.date!))
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
                            "${bloc.bookingSeleccionado?.initialTime} - ${bloc.bookingSeleccionado?.finalTime}"),
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
                        text:
                            MyUtils.formatPrice(bloc.bookingSeleccionado!.price!)
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
              isEnabled: false,
              controller: TextEditingController(
                  text: bloc.bookingSeleccionado?.phoneNumber ?? ''),
            ),
            const SizedBox(height: 14),
            MyTextFieldContainer(
              title: 'Email',
              isEnabled: false,
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
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  // void _openmodal(BuildContext context, String tittle) {
  //   Future.delayed(Duration.zero, () async {
  //     ConfirmAlternant(context: context, action: () => _processconfirm(context))
  //         .confirmDialogBack(tittle, '¿Está seguro de completar la reserva?',
  //             "   CANCELAR   ", "    SI   ", 120.00);
  //   });
  // }

  void _processconfirm(BuildContext context) async {
    final bloc = Provider.of<ScheduleBloc>(context, listen: false);

    final myLoading = MyLoading(context: context);
    myLoading.createLoading();

    var response = await bloc.completeBooking();
    // comentario: _comentariosController.text,

    // priceFinal: _precioFinalController.text);

    if (response.statusCode == 200) {
      Future.delayed(Duration.zero, () {
        Future.delayed(Duration.zero, () async {
          final action = await MyAlerts.sucess(context: context);
          if (action == DialogsAlerts.yes) {
            Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
          }
        });
      });
    }
    myLoading.dismiss();
  }
}
