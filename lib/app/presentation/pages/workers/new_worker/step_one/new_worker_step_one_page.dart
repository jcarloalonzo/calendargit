import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_one/new_worker_step_one_bloc.dart';
import '../../../../blocs/workers/new_worker/new_worker_step_one/new_worker_step_one_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'new_worker_step_one_body.dart';

class NewWorkerStepOnePage extends StatelessWidget {
  const NewWorkerStepOnePage({super.key});
  static String route = '/NewWorkerStepOnePage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewWorkerStepOneBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewWorkerStepOneBloc, NewWorkerStepOneState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<NewWorkerStepOneBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          titleAppBar: texts.label.newCollaborator,
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => NewWorkerBody(),
          ),
        );
      },
    );
  }
}
