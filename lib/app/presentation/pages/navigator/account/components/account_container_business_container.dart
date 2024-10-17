import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../blocs/general/session/session_bloc.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';

class AccountContainerBusinessContainer extends StatelessWidget {
  const AccountContainerBusinessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final business = context.read<SessionBloc>().state.business;
    return MyCardContainer(
      backgroundColor: Palette.colorApp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            'SPA',
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.white,
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.account_balance_sharp,
                color: Palette.white,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                business?.businessName ?? '',
                color: Palette.white,
                fontWeight: FontWeight.w700,
                size: SizeText.text4 - 1,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
