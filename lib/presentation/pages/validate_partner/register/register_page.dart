import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/only_portroit.dart';
import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../widgets/my_background.dart';
import 'register_bloc.dart';
import 'register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage._();
  static String routeName = '/registerPageLogin';
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => RegisterBloc()..init(context),
      child: const RegisterPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: true);

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
        child: RegisterBody(),
      ),
    );
  }
}
