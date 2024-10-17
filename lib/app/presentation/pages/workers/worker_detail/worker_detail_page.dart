import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../../domain/models/worker.dart';
import '../../../blocs/workers/worker_detail/worker_detail_bloc.dart';
import '../../../blocs/workers/worker_detail/worker_detail_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/my_background.dart';
import 'worker_detail_body.dart';

class WorkerDetailPage extends StatelessWidget {
  const WorkerDetailPage({super.key, required this.worker});
  static String route = '/WorkerDetailPage';
  final Worker worker;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WorkerDetailBloc>()..init(worker: worker),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerDetailBloc, WorkerDetailState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<WorkerDetailBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => WorkerDetailBody(model: model),
          ),
        );
      },
    );
  }
}
