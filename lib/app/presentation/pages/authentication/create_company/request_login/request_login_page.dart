import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../blocs/authentication/create_company/request_login/request_login_bloc.dart';
import '../../../../blocs/authentication/create_company/request_login/request_login_state.dart';
import '../../../../blocs/authentication/create_company/request_office/screen_model/request_office_screen_model.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'request_login_body.dart';

class RequestLoginPage extends StatelessWidget {
  const RequestLoginPage({super.key, required this.stepModel});
  final RequestOfficeScreenModel stepModel;
  static String route = '/RequestLoginPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RequestLoginBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestLoginBloc, RequestLoginState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<RequestLoginBloc>().cleanError);
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
            loaded: (_, model) => RequestLoginBody(model: model),
          ),
        );
      },
    );
  }
}
