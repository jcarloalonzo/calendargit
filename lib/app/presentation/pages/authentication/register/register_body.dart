import 'package:flutter/material.dart';

import '../../../../../config/app_config/palette.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../blocs/authentication/register/screen_model/register_screen_model.dart';
import '../../../widgets/my_text.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key, required this.model});
  final RegisterScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyText(
          '¡Bienvenido!, Ingresa un usuario/email y una contraseña para poder registrarte.',
          size: SizeText.text3 - 2,
          maxLines: 3,
          color: Palette.gray3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
