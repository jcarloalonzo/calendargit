import 'package:calendario/core/config/only_portroit.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_config.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/pages/validate_partner/login/login_bloc.dart';
import 'package:calendario/presentation/widgets/confirm_alternate.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_body.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/loginPage";
  const LoginPage._();
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

    if (bloc.error != null) {
      if (bloc.error!.statusCode != 200) {
        Future.delayed(Duration.zero, () async {
          confirmAlternantError(
              context: context,
              errormodel: bloc.error!.error!,
              statuscode: bloc.error!.statusCode!);
          bloc.error = null;
        });
      }
    }

    onlyPortroitOrientation();
    SizeConfig().init(context);

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
