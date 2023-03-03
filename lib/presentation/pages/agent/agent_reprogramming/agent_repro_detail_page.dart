import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../bloc/main_bloc.dart';
import '../../../bloc/schedule_bloc.dart';
import '../../../widgets/my_alerts.dart';
import '../../../widgets/my_background_with_buttons.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_dialogs.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../navigator/background_navigator.dart';

class AgentReproDetailPage extends StatelessWidget {
  const AgentReproDetailPage({Key? key}) : super(key: key);
  static String routeName = '/agentReproDetailPage';

  void _processconfirm(BuildContext context) async {
    final bloc = Provider.of<ScheduleBloc>(context, listen: false);
    final blocLogin = Provider.of<MainBloc>(context, listen: false);
    final myLoading = MyLoading(context);
    myLoading.createLoading();
    var response = await bloc.reprogramBookingService(blocLogin.model!);
    if (response.statusCode == 200) {
      Future.delayed(Duration.zero, () async {
        final action = await MyAlerts.sucess(context: context);
        if (action == DialogsAlerts.yes) {
          Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
        }
      });
    }
    myLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return MyBackGroundWithButtons(
      allAnchorwindow: false,
      titleAppBar: 'Reprogramar Reserva',
      bottomExpanded: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: MyButtom(
          text: 'CONTINUAR',
          color: Palette.blue,
          onTap: () async {
            final action = await MyDialogs.yesAbortDialog(
                context: context,
                title: 'Reprogramar Reserva',
                body: '¿Está seguro de reprogramar la reserva?');

            if (action == DialogAction.yes) {
              // print('yes');
              return _processconfirm(context);
            }
          },
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 22),
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
          Row(
            children: const [
              MyText(
                text: 'Programación anterior',
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
                  title: 'Fecha',
                  isEnabled: false,
                  controller: TextEditingController(
                      text:
                          (MyUtils.formatDate(bloc.bookingSeleccionado!.date!))
                              .toString()),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MyTextFieldContainer(
                  title: 'Inicio - Fin',
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
            children: const [
              MyText(
                text: 'Programación actual',
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
                  title: 'Fecha',
                  isEnabled: false,
                  controller:
                      TextEditingController(text: bloc.dateSelectedTurn!),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MyTextFieldContainer(
                  title: 'Inicio - Fin',
                  isEnabled: false,
                  controller: TextEditingController(
                      text:
                          '${bloc.programTurnSelected?.initialTurn} - ${bloc.programTurnSelected?.finalTurn}'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
