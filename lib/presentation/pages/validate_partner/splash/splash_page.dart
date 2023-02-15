import 'package:calendario/core/config/palette.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/pages/validate_partner/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendario/presentation/pages/validate_partner/splash/splash_body.dart';

import '../../../../core/config/only_portroit.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splashPage";
  const SplashPage._();
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc()..init(context),
      child: const SplashPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainBloc>(context);

    onlyPortroitOrientation();

    ResponseModel.handleError(bloc, context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Palette.colorApp,
        body: SplashBody(),
      ),
    );
  }
}
