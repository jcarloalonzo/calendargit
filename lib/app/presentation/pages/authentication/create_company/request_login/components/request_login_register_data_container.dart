import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../config/app_config/size_text.dart';
import '../../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../../generated/translations.g.dart';
import '../../../../../blocs/authentication/create_company/request_login/request_login_bloc.dart';
import '../../../../../widgets/my_card_container.dart';
import '../../../../../widgets/my_text.dart';
import '../../../../../widgets/textfield_general.dart';

class RequestLoginRegisterDataContainer extends StatelessWidget {
  const RequestLoginRegisterDataContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            texts.label.officeData,
            size: SizeText.text3 - 1,
            fontWeight: FontWeight.w500,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            // controller: _officeNameTextController,
            isImportantFormRed: true,
            title: texts.label.user,
            onChanged: context.read<RequestLoginBloc>().setUsername,
          ),
          SpaceHelpers.verticalNormal,
          MyTextField(
            // controller: _officeAddressTextController,
            isImportantFormRed: true,
            isPassword: true,
            title: texts.label.password,
            onChanged: context.read<RequestLoginBloc>().setPassword,
          ),
        ],
      ),
    );
  }
}
