import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../../../generated/translations.g.dart';
import '../../../blocs/workers/workers/workers_bloc.dart';
import '../../../blocs/workers/workers/workers_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/my_background.dart';
import '../new_worker/step_one/new_worker_step_one_page.dart';
import 'workers_body.dart';

class WorkersPage extends StatelessWidget {
  const WorkersPage({super.key});
  static String route = '/WorkersPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WorkersBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkersBloc, WorkersState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<WorkersBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          backPageEnable: false,
          isDrawer: state is! WorkersStateLoading,
          titleAppBar: texts.label.collaborators,
          wFloatingActionButtom: state.whenOrNull(
            loaded: (__, _) {
              return FloatingActionButton(
                onPressed: () => _onTapAddButtom(context),
                child: Icon(Icons.add),
              );
            },
          ),
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => WorkersBody(workers: model.workers),
          ),
        );
      },
    );
  }

  void _onTapAddButtom(BuildContext context) async {
    context.push(NewWorkerStepOnePage.route);
  }
}
