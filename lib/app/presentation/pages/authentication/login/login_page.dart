import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../blocs/authentication/login/login_bloc.dart';
import '../../../blocs/authentication/login/login_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/my_background.dart';
import 'login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String route = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<LoginBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          backPageEnable: false,
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => LoginBody(),
          ),
        );
      },
    );
  }
}
