import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../dependency_injection.dart';
import '../../blocs/splash/splash_cubit.dart';
import 'splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.colorApp,
      body: SplashBody(),
    );
  }
}
