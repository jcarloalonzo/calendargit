import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../blocs/authentication/create_company/request_company/request_company_bloc.dart';
import '../../../../blocs/authentication/create_company/request_company/request_company_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'request_company_body.dart';

class RequestCompanyPage extends StatelessWidget {
  const RequestCompanyPage({super.key});
  static String route = '/RequestCompanyPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RequestCompanyBloc>()..init(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestCompanyBloc, RequestCompanyState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<RequestCompanyBloc>().cleanError);
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
            loaded: (_, model) => RequestCompanyBody(model: model),
          ),
        );
      },
    );
  }
}
