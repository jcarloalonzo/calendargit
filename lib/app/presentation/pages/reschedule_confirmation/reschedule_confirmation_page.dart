import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/helpers/helpers.dart';
import '../../../../dependency_injection.dart';
import '../../blocs/reschedule_booking/screen_model/reschedule_booking_screen_model.dart';
import '../../blocs/reschedule_confirmation/reschedule_confirmation_bloc.dart';
import '../../blocs/reschedule_confirmation/reschedule_confirmation_state.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/my_background.dart';
import 'reschedule_confirmation_body.dart';

class RescheduleConfirmationPage extends StatelessWidget {
  const RescheduleConfirmationPage({super.key, required this.stepModel});
  static String route = '/RescheduleConfirmationPage';
  final RescheduleBookingScreenModel stepModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<RescheduleConfirmationBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RescheduleConfirmationBloc,
        RescheduleConfirmationState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<RescheduleConfirmationBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          isAppBar: false,
          // child: RescheduleConfirmationBody(),
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => RescheduleConfirmationBody(model: model),
          ),
        );
      },
    );
  }
}
