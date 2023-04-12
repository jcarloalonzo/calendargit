import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/only_portroit.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../widgets/my_background.dart';
import 'services_subscription_bloc.dart';
import 'services_subscription_body.dart';

class ServicesSubscriptionPage extends StatelessWidget {
  const ServicesSubscriptionPage._();
  static String routeName = '/ServicesSubscriptionPage';
  static Widget init(
    BuildContext context, {
    required CompanyByTokenResponse company,
    required CreateCompanyRequest request,
  }) {
    return ChangeNotifierProvider(
      create: (_) => ServicesSubscriptionBloc()
        ..init(
          context,
          companyO: company,
          requestO: request,
        ),
      child: const ServicesSubscriptionPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ServicesSubscriptionBloc>(context, listen: true);

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
        child: const ServicesSubscriptionBody(),
      ),
    );
  }
}
