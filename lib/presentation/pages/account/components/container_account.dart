import 'package:flutter/material.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../account_bloc.dart';

class ContainerAccount extends StatelessWidget {
  const ContainerAccount({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final AccountBloc bloc;
  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      backgroundColor: Palette.colorApp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const MyText(
            text: 'SPA',
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.white,
          ),
          const MySizedBoxHeight(),
          Row(
            children: [
              const Icon(
                Icons.account_balance_sharp,
                color: Palette.white,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: bloc.office.businessName ?? '',
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
