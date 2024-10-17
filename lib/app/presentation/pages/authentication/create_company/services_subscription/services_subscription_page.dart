import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../blocs/authentication/create_company/categories_subscription/screen_model/categories_subscription_screen_model.dart';
import '../../../../blocs/authentication/create_company/services_subscription/services_subscription_bloc.dart';
import '../../../../blocs/authentication/create_company/services_subscription/services_subscription_state.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'services_subscription_body.dart';

class ServicesSubscriptionPage extends StatelessWidget {
  const ServicesSubscriptionPage({super.key, required this.stepModel});
  static String route = '/ServicesSubscriptionPage';
  final CategoriesSubscriptionScreenModel stepModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ServicesSubscriptionBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesSubscriptionBloc, ServicesSubscriptionState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<ServicesSubscriptionBloc>().cleanError);
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
            loaded: (_, model) => ServicesSubscriptionBody(model: model),
          ),
        );
      },
    );
  }
}
