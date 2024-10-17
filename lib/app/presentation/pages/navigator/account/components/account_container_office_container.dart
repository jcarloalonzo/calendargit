import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/app_config/space_helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/user_business_dto.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_text.dart';

class AccountContainerOfficeContainer extends StatelessWidget {
  const AccountContainerOfficeContainer({
    super.key,
    required this.office,
  });
  final UserBusinessDto office;

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      backgroundColor: Palette.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            texts.label.office,
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.colorApp,
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              const Icon(
                Icons.other_houses,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                office.descriptionOffice,
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
                Icons.code,
                color: Palette.colorApp,
                size: 19,
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                office.officeCode,
                color: Palette.colorApp,
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
