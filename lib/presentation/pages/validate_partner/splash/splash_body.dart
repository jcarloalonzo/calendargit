// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../bloc/main_bloc.dart';
import '../../navigator/background_navigator.dart';
import '../create_company/create_company_page.dart';
import '../login/login_page.dart';
import '../token/token_page.dart';
import 'splash_bloc.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  void _init() async {
    final prefs = PreferencesUser();
    final mainBloc = context.read<MainBloc>();
    final bloc = context.read<SplashBloc>();
    final result = await bloc.validateSession();
    print(result);
    switch (result) {
      case TypeLogin.token:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => TokenPage.init(ctx)));
        return;
      case TypeLogin.login:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => LoginPage.init(ctx)));
        return;
      case TypeLogin.register:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => CreateCompanyPage.init(ctx)));
        return;
      case TypeLogin.home:
        final user = prefs.user;
        mainBloc.login = LoginResponse.loginModelFromJson(user!);
        Navigator.pushNamedAndRemoveUntil(
            context, BackGroundNavigator.routeName, (route) => false);
        return;
      default:
    }

    // final loginBloc = Provider.of<MainBloc>(context, listen: false);
    // if (loginBloc.model == null) {
    //   if (prefsUser.userLoginResponse != null) {
    //     var a = loginModelFromJson(prefsUser.userLoginResponse!);
    //     final loginBloc = Provider.of<MainBloc>(context, listen: false);
    //     loginBloc.model = a;
    //   }
    // }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
      // print('init');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.colorApp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/png/schedule.png',
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
