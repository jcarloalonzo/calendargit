import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/only_portroit.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_config.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import 'register_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: true);
    final prefsUser = PreferencesUser();

    onlyPortroitOrientation();
    SizeConfig().init(context);
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0),
            SvgPicture.asset(
              'assets/svg/Search engine _Monochromatic.svg',
              height: 130.0,
            ),
            const SizedBox(height: 40.0),
            const MyText(
              text:
                  '¡Bienvenido!, Ingresa un usuario/email y una contraseña para poder registrarte.',
              size: SizeText.text3 - 2,
              maxLines: 3,
              color: Palette.gray3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            TextFieldGeneral(
              hintext: 'Usuario y/o Email',
              controller: bloc.userController,
            ),
            const SizedBox(height: 10.0),
            TextFieldGeneral(
              hintext: 'Password',
              obscureText: true,
              controller: bloc.passwordController,
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(height: 15.0),
            MyButtom(
              text: 'REGISTRAR',
              onTap: () => _buttomlogin(context),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Future<void> _buttomlogin(BuildContext context) async {
    final prefs = PreferencesUser();

    final myLoading = MyLoading(context);
    myLoading.createLoading();
    // await bloc.confirmLogin();
    myLoading.dismiss();

    // Future.delayed(Duration.zero, () {
    //   if (bloc.error!.statusCode == 200) {
    //     agendaBloc.setPersonID = bloc.model?.personId;

    //     //

    //     String data = (loginModelToJson(bloc.model!));

    //     prefsUser.userLoginResponse = data;

    //     //
    //     //

    //     // Navigator.of(context).pushNamedAndRemoveUntil(
    //     //     NavigationPage.routeName, (Route<dynamic> route) => false,
    //     //     arguments: true);
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, BackGroundNavigator.routeName, (route) => false);
    //   }
    // });
  }
}
