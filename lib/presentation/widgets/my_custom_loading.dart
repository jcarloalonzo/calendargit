import 'package:flutter/material.dart';

import '../../core/config/palette.dart';

class MyCustomLoading extends StatelessWidget {
  const MyCustomLoading({
    Key? key,
    this.tamano = 50,
  }) : super(key: key);
  final double tamano;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: tamano,
      height: tamano,
      // child: LoadingIndicator(
      //   indicatorType: Indicator.ballRotate,
      //   colors: _kDefaultRainbowColors,
      //   strokeWidth: 1.0,
      // ),
      child: const CircularProgressIndicator(
        backgroundColor: Palette.colorApp,
        color: Palette.grey4,
      ),
    ));
  }
}
