import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/helpers/helpers.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../domain/models/booking.dart';
import '../../blocs/reschedule_booking/reschedule_booking_bloc.dart';
import '../../blocs/reschedule_booking/reschedule_booking_state.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/my_background.dart';
import 'reschedule_booking_body.dart';

class RescheduleBookingPage extends StatelessWidget {
  const RescheduleBookingPage({super.key, required this.booking});
  static String route = '/RescheduleBookingPage';
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RescheduleBookingBloc>()..init(booking: booking),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RescheduleBookingBloc, RescheduleBookingState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<RescheduleBookingBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          isAppBar: true,
          titleAppBar: texts.label.rescheduleAppointment,
          // child: RescheduleBookingBody(),
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => RescheduleBookingBody(model: model),
          ),
        );
      },
    );
  }
}
