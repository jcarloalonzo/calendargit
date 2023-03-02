import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/only_portroit.dart';
import '../../../../core/config/size_config.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../bloc/agenda_bloc.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../navigator/background_navigator.dart';
import 'login_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: true);
    final prefsUser = PreferencesUser();

    onlyPortroitOrientation();
    SizeConfig().init(context);
    // ignore: prefer_const_constructors
    return Center(
      child: SingleChildScrollView(
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
                    '¡Bienvenido!, Ingresa tu usuario y/o email para poder continuar.',
                size: SizeText.text3 - 2,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              TextFieldGeneral(
                controller: bloc.userController,
                hintext: 'Usuario y/o Email',
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
                text: 'Ingresar',
                // onTap: !bloc.validatebuttom
                //     ? null
                //     : () => _buttomlogin(context, bloc),
                onTap: () => _buttomlogin(context),
                height: 50,
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _buttomlogin(BuildContext context) async {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    final prefsUser = PreferencesUser();

    final agendaBloc = Provider.of<AgendaBloc>(context, listen: false);

    final myLoading = MyLoading(context: context);
    myLoading.createLoading();
    final response = await bloc.confirmLogin();
    myLoading.dismiss();

    if (response == null) return;

    String data = (loginModelToJson(response));

    prefsUser.userLoginResponse = data;

    //
    //

    // Navigator.of(context).pushNamedAndRemoveUntil(
    //     NavigationPage.routeName, (Route<dynamic> route) => false,
    //     arguments: true);
    Navigator.pushNamedAndRemoveUntil(
        context, BackGroundNavigator.routeName, (route) => false);
  }
}
