import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../blocs/navigator/home/home_bloc.dart';
import '../../../blocs/navigator/home/home_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<HomeBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => HomeBody(model: model),
          ),
        );
      },
    );
  }
}
