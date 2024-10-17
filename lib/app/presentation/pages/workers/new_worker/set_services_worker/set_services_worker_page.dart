import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/workers/new_worker/set_services_worker/set_services_worker_bloc.dart';
import '../../../../blocs/workers/new_worker/set_services_worker/set_services_worker_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'set_services_worker_body.dart';

class SetServicesWorkerPage extends StatelessWidget {
  const SetServicesWorkerPage({super.key, required this.personId});
  static String route = '/SetServicesWorkerPage';
  final int personId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SetServicesWorkerBloc>()..init(personId: personId),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetServicesWorkerBloc, SetServicesWorkerState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<SetServicesWorkerBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          backPageEnable: false,
          titleAppBar: texts.label.assignServices,
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => SetServicesWorkerBody(model: model),
          ),
        );
      },
    );
  }
}
