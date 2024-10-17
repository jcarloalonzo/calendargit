import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_config/custom_assets.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../domain/models/user.dart';
import '../../../blocs/authentication/login/login_bloc.dart';
import '../../../widgets/custom_svg_picture.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../../widgets/util/loader.dart';
import '../../navigator/navigator_page.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SpaceHelpers.verticalNormal,
          SpaceHelpers.verticalNormal,
          CustomSvgPicture(
            CustomAssetsSVG.login,
            size: 200,
          ),
          SpaceHelpers.verticalNormal,
          MyText(
            texts.messages.welcomeEnterYourUsernameAndEmailToContinue,
            size: SizeText.text3 - 2,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            hintText: texts.label.usernameOrEmail,
            onChanged: context.read<LoginBloc>().setUsername,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            hintText: texts.label.password,
            // suffixIcon: const Icon(Icons.remove_red_eye),
            onChanged: context.read<LoginBloc>().setPassword,
          ),
          SpaceHelpers.verticalNormal,
          MyButtom(
            texts.label.login,
            onTap: () => _buttomlogin(context),
            height: 50,
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  void _buttomlogin(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final bloc = context.read<LoginBloc>();
    final User? user = await Loader.showLoader(context, bloc.login());
    if (!context.mounted) return;
    if (user == null) return;
    context.go(NavigatorPage.route);
  }
}
