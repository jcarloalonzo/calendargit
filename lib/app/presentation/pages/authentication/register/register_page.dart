import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../blocs/authentication/register/register_bloc.dart';
import '../../../blocs/authentication/register/register_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/my_background.dart';
import 'register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String route = '/RegisterPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<RegisterBloc>().cleanError);
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
            loaded: (_, model) => RegisterBody(model: model),
          ),
        );
      },
    );
  }
}
