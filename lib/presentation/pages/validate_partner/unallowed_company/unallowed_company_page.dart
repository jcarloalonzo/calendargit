import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/only_portroit.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../widgets/my_background.dart';
import 'unallowed_company_bloc.dart';
import 'unallowed_company_body.dart';

class UnallowedCompanyPage extends StatelessWidget {
  const UnallowedCompanyPage._();
  static String routeName = '/UnallowedCompanyPage';
  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UnallowedCompanyBloc()..init(context),
      child: const UnallowedCompanyPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<UnallowedCompanyBloc>(context, listen: true);

    onlyPortroitOrientation();

    ResponseModel.handleError(bloc, context);
    // ignore: prefer_const_constructors
    return SafeArea(
      child: const MyBackGround(
        backgroundColor: Palette.white,
        // backgroundColor: Palette.colorApp,
        // backPageEnable: false,
        backPageEnable: false,
        isAppBar: false,
        allAnchorwindow: true,
        // buttomGeneralWidget: ButtomGeneral(
        //   text: 'qwe',
        // ),

        child: UnallowedCompanyBody(),
      ),
    );
  }
}
