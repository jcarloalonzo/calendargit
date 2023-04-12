import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';

class UnallowedCompanyBody extends StatelessWidget {
  const UnallowedCompanyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/error.svg',
              height: 150,
              width: 150,
            ),
            const MySizedBoxHeight(kDouble: 40),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyText(
                text:
                    'Ocurrio un error con la validación de sus credenciales, por favor consulte con su administrador.',
                maxLines: 3,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                color: Palette.colorApp,
                size: SizeText.text3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
