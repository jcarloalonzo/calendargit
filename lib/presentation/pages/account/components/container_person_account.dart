import 'package:flutter/material.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';

class ContainerPersonAccount extends StatelessWidget {
  const ContainerPersonAccount({
    Key? key,
    required this.login,
  }) : super(key: key);

  final LoginResponse login;

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      backgroundColor: Palette.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const MyText(
            text: 'Usuario',
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.colorApp,
          ),
          const MySizedBoxHeight(),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              Flexible(
                child: MyText(
                  text: login.name ?? '',
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text4 - 1,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const MySizedBoxHeight(kDouble: 5),
          Row(
            children: [
              const Icon(
                Icons.co_present_outlined,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: login.documentNumber ?? '',
                color: Palette.colorApp,
                fontWeight: FontWeight.w700,
                size: SizeText.text4 - 1,
                maxLines: 2,
              ),
            ],
          ),
          const MySizedBoxHeight(kDouble: 5),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: login.phoneNumber ?? '-',
                color: Palette.colorApp,
                fontWeight: FontWeight.w700,
                size: SizeText.text4 - 1,
                maxLines: 2,
              ),
            ],
          ),
          const MySizedBoxHeight(kDouble: 5),
          Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: login.emailAddress ?? '',
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
