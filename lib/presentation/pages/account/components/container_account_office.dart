import 'package:flutter/material.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';

class ContainerAccountOffice extends StatelessWidget {
  const ContainerAccountOffice({
    Key? key,
    required this.office,
  }) : super(key: key);
  final UserBusinessDto office;

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      backgroundColor: Palette.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const MyText(
            text: 'Oficina',
            fontWeight: FontWeight.w500,
            size: SizeText.text4,
            color: Palette.colorApp,
          ),
          const MySizedBoxHeight(),
          Row(
            children: [
              const Icon(
                Icons.other_houses,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: office.descriptionOffice ?? '',
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
                Icons.code,
                color: Palette.colorApp,
                size: 19,
              ),
              const MySizedBoxWidth(),
              MyText(
                text: office.officeCode ?? '',
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
