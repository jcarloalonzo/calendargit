import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../blocs/authentication/create_company/categories_subscription/categories_subscription_bloc.dart';
import '../../../../blocs/authentication/create_company/categories_subscription/categories_subscription_state.dart';
import '../../../../blocs/authentication/create_company/request_login/screen_model/request_login_screen_model.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/my_background.dart';
import 'categories_subscription_body.dart';

class CategoriesSubscriptionPage extends StatelessWidget {
  const CategoriesSubscriptionPage({super.key, required this.stepModel});
  static String route = '/CategoriesSubscriptionPage';
  final RequestLoginScreenModel stepModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CategoriesSubscriptionBloc>()..init(stepModel: stepModel),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesSubscriptionBloc,
        CategoriesSubscriptionState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<CategoriesSubscriptionBloc>().cleanError);
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
            loaded: (_, model) => CategoriesSubscriptionBody(model: model),
          ),
        );
      },
    );
  }
}
