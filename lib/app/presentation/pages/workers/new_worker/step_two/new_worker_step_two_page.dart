import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_one/screen_model/new_worker_step_one_screen_model.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_two/new_worker_step_two_bloc.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_two/new_worker_step_two_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'new_worker_step_two_body.dart';

class NewWorkerStepTwoPage extends StatelessWidget {
  const NewWorkerStepTwoPage({super.key, required this.stepModel});
  static String route = '/NewWorkerStepTwoPage';
  final NewWorkerStepOneScreenModel stepModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewWorkerStepTwoBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewWorkerStepTwoBloc, NewWorkerStepTwoState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<NewWorkerStepTwoBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          titleAppBar: texts.label.credentials,
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => NewWorkerStepTwoBody(model: model),
          ),
        );
      },
    );
  }
}
