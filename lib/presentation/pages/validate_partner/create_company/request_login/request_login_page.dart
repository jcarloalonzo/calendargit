import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/only_portroit.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../widgets/my_background.dart';
import 'request_login_bloc.dart';
import 'request_login_body.dart';

class RequestLoginPage extends StatelessWidget {
  const RequestLoginPage._();
  static String routeName = '/RequestLoginPage';
  static Widget init(
    BuildContext context, {
    required CompanyByTokenResponse company,
    required CreateCompanyRequest request,
  }) {
    return ChangeNotifierProvider(
      create: (_) => RequestLoginBloc()
        ..init(
          context,
          companyO: company,
          requestO: request,
        ),
      child: const RequestLoginPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RequestLoginBloc>(context, listen: true);

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

        child: const RequestLoginBody(),
      ),
    );
  }
}
