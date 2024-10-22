import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_config/custom_assets.dart';
import '../../../../config/app_config/palette.dart';
import '../../blocs/general/bookings/bookings_bloc.dart';
import '../../blocs/splash/splash_cubit.dart';
import '../authentication/create_company/request_company/request_company_page.dart';
import '../authentication/login/login_page.dart';
import '../authentication/token/token_page.dart';
import '../navigator/navigator_page.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  void _init() async {
    try {
      final bloc = context.read<SplashCubit>();
      final result = await bloc.validateSession();
      switch (result) {
        case TypeLogin.token:
          _goTo(TokenPage.route);
          return;
        case TypeLogin.login:
          _goTo(LoginPage.route);
          return;
        case TypeLogin.register:
          _goTo(RequestCompanyPage.route);
          return;
        case TypeLogin.home:
          await Future.delayed(Duration(seconds: 1));
          context.read<BookingsBloc>().init();
          _goTo(NavigatorPage.route);
          return;

        case TypeLogin.unallowedLicense:
        default:
      }
    } catch (e) {
      _goTo(TokenPage.route);
    }
  }

  void _goTo(String routeName) {
    context.go(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(CustomAssetsPNG.jelaf),
              const SizedBox(height: 60),
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Palette.white,
                  // backgroundColor: Color(0xff7e4e9b),
                ),
              ),
            ],
          ),
        ),
        const Text(
          '© 2024 JELAF',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
