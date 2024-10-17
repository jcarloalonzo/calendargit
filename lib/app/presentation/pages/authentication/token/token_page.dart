import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../blocs/authentication/token/token_bloc.dart';
import '../../../blocs/authentication/token/token_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/my_background.dart';
import 'token_body.dart';

class TokenPage extends StatelessWidget {
  const TokenPage({super.key});
  static String route = '/TokenPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TokenBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TokenBloc, TokenState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<TokenBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          isAppBar: false,
          // child: TokenBody(),
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => TokenBody(),
          ),
        );
      },
    );
  }
}
