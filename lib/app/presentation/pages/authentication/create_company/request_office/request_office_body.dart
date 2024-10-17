import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/authentication/create_company/request_office/request_office_bloc.dart';
import '../../../../blocs/authentication/create_company/request_office/screen_model/request_office_screen_model.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../request_login/request_login_page.dart';
import 'components/request_office_office_data_container.dart';

class RequestOfficeBody extends StatelessWidget {
  const RequestOfficeBody({super.key, required this.model});
  final RequestOfficeScreenModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            texts.label.office,
            size: 40,
            color: Palette.colorApp,
          ),
          MyText(
            texts.messages.pleaseRegisterYourMainOffice,
            size: SizeText.text2,
            maxLines: 3,
            color: Palette.colorApp,
          ),
          SpaceHelpers.verticalNormal,
          RequestOfficeOfficeDataContainer(model: model),
          SpaceHelpers.verticalNormal,
          MyButtom(
            texts.label.continu,
            onTap: () => _onTapContinue(context),
          ),
        ],
      ),
    );
  }

  void _onTapContinue(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<RequestOfficeBloc>();
    final RequestOfficeScreenModel? data = bloc.modelData();
    if (data == null) return;
    context.push(RequestLoginPage.route, extra: data);
  }
}
