import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/only_portroit.dart';
import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../widgets/my_background.dart';
import 'login_bloc.dart';
import 'login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage._();
  static String routeName = '/loginPage';
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => LoginBloc()..init(context),
      child: const LoginPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: true);

    onlyPortroitOrientation();

    ResponseModel.handleError(bloc, context);
    // ignore: prefer_const_constructors
    return SafeArea(
      child: const MyBackGround(
        backgroundColor: Palette.white,
        backPageEnable: false,
        isAppBar: false,
        // buttomGeneralWidget: ButtomGeneral(
        //   text: 'qwe',
        // ),
        child: LoginBody(),
      ),
    );
  }
}
