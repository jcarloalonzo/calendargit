import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/user.dart';
import '../../../../blocs/general/session/session_bloc.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';

class AccountContainerPersonAccountContainer extends StatelessWidget {
  const AccountContainerPersonAccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<SessionBloc>().state.user;
    return MyCardContainer(
      backgroundColor: Palette.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            texts.label.user,
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.colorApp,
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              Flexible(
                child: MyText(
                  user?.name ?? '',
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text4 - 1,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.co_present_outlined,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                user?.documentNumber ?? '',
                color: Palette.colorApp,
                fontWeight: FontWeight.w700,
                size: SizeText.text4 - 1,
                maxLines: 2,
              ),
            ],
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                user?.phoneNumber ?? '-',
                color: Palette.colorApp,
                fontWeight: FontWeight.w700,
                size: SizeText.text4 - 1,
                maxLines: 2,
              ),
            ],
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                user?.emailAddress ?? '',
                color: Palette.colorApp,
                fontWeight: FontWeight.w700,
                size: SizeText.text4,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
