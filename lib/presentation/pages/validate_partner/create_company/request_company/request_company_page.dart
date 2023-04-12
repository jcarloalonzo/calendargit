import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/only_portroit.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../widgets/my_background.dart';
import 'request_company_bloc.dart';
import 'request_company_body.dart';

class RequestCompanyPage extends StatelessWidget {
  const RequestCompanyPage._();
  static String routeName = '/RequestCompanyPage';
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => RequestCompanyBloc()..init(context),
      child: const RequestCompanyPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RequestCompanyBloc>(context, listen: true);

    onlyPortroitOrientation();

    ResponseModel.handleError(bloc, context);
    // ignore: prefer_const_constructors
    return SafeArea(
      child: MyBackGround(
        backgroundColor: Palette.white,
        // backgroundColor: Palette.colorApp,
        // backPageEnable: false,

        isAppBar: false,
        allAnchorwindow: true,
        isLoading: bloc.isLoading,
        // buttomGeneralWidget: ButtomGeneral(
        //   text: 'qwe',
        // ),

        child: const RequestCompanyBody(),
      ),
    );
  }
}
