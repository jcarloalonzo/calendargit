import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../blocs/authentication/create_company/request_company/screen_model/request_company_screen_model.dart';
import '../../../../blocs/authentication/create_company/request_office/request_office_bloc.dart';
import '../../../../blocs/authentication/create_company/request_office/request_office_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'request_office_body.dart';

class RequestOfficePage extends StatelessWidget {
  const RequestOfficePage({super.key, required this.stepModel});
  static String route = '/RequestOfficePage';
  final RequestCompanyScreenModel stepModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RequestOfficeBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestOfficeBloc, RequestOfficeState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<RequestOfficeBloc>().cleanError);
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
            loaded: (_, model) => RequestOfficeBody(model: model),
          ),
        );
      },
    );
  }
}
