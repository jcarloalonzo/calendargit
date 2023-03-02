import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/only_portroit.dart';
import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import 'splash_bloc.dart';
import 'splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage._();
  static String routeName = '/splashPage';
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
    final bloc = Provider.of<SplashBloc>(context);

    onlyPortroitOrientation();

    ResponseModel.handleError(bloc, context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        backgroundColor: Palette.colorApp,
        body: SplashBody(),
      ),
    );
  }
}
