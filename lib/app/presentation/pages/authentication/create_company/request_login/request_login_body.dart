import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../blocs/authentication/create_company/request_login/request_login_bloc.dart';
import '../../../../blocs/authentication/create_company/request_login/screen_model/request_login_screen_model.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_text.dart';
import '../categories_subscription/categories_subscription_page.dart';
import 'components/request_login_register_data_container.dart';

class RequestLoginBody extends StatelessWidget {
  const RequestLoginBody({super.key, required this.model});
  final RequestLoginScreenModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            texts.label.adminUser,
            size: 40,
            color: Palette.colorApp,
          ),
          MyText(
            texts
                .messages.itsJustOneStepAwayPleaseRegisterAsAnAdministratorUser,
            size: SizeText.text2,
            maxLines: 3,
            color: Palette.colorApp,
          ),
          RequestLoginRegisterDataContainer(),
          SpaceHelpers.verticalLong,
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
    final bloc = context.read<RequestLoginBloc>();
    final RequestLoginScreenModel? data = bloc.modelData();
    if (data == null) return;
    context.push(CategoriesSubscriptionPage.route, extra: data);
  }
}
