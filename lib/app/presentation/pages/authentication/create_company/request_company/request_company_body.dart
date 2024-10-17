import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/authentication/create_company/request_company/request_company_bloc.dart';
import '../../../../blocs/authentication/create_company/request_company/screen_model/request_company_screen_model.dart';
import '../../../../widgets/business_header_request_data_container.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../request_office/request_office_page.dart';
import 'components/request_company_company_data_container.dart';
import 'components/request_company_contact_data_container.dart';

class RequestCompanyBody extends StatelessWidget {
  const RequestCompanyBody({super.key, required this.model});
  final RequestCompanyScreenModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            '¡${texts.label.welcome}!',
            size: 30,
            color: Palette.colorApp,
          ),
          MyText(
            texts.messages.pleaseRegisterYourCompany,
            size: SizeText.text1,
            maxLines: 3,
            color: Palette.colorApp,
          ),
          BusinessHeaderRequestDataContainer(),
          RequestCompanyCompanyDataContainer(model: model),
          RequestCompanyContactDataContainer(model: model),
          SpaceHelpers.verticalNormal,
          MyButtom(
            texts.label.continu,
            onTap: () => _onTapContinue(context),
          ),
          SpaceHelpers.verticalLong,
        ],
      ),
    );
  }

  void _onTapContinue(BuildContext context) {
    FocusScope.of(context).unfocus();
    final bloc = context.read<RequestCompanyBloc>();
    final RequestCompanyScreenModel? data = bloc.modelData();
    if (data == null) return;
    context.push(RequestOfficePage.route, extra: data);
  }
}
