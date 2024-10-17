import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 28,
      width: 28,
      child: CircularProgressIndicator(color: Palette.primaryColor),
    ));
  }
}
