import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/responses/business_response.dart';
import 'reschedule_appointment_bloc.dart';

class RescheduleAppointmentBody extends StatelessWidget {
  const RescheduleAppointmentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RescheduleAppointmentBloc>(context);
    final BusinessResponse company = bloc.business;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            //
            //
            //

            //
          ],
        ),
      ),
      //
    );
  }
}
