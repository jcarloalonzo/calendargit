import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../../data/models/entities/response_model.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_background.dart';
import 'reschedule_appointment_bloc.dart';
import 'reschedule_appointment_body.dart';

class RescheduleAppointmentPage extends StatelessWidget {
  const RescheduleAppointmentPage._();
  static String routeName = '/RescheduleAppointmentPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RescheduleAppointmentBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const RescheduleAppointmentPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<RescheduleAppointmentBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Reprogramar Cita',
      isAppBar: true,
      backgroundColor: Palette.colorApp,
      allAnchorwindow: true,
      child: const RescheduleAppointmentBody(),
    );
  }
}
