import 'package:calendario/core/config/palette.dart';
import 'package:flutter/material.dart';

class MyCustomLoading extends StatelessWidget {
  final double tamano;
  const MyCustomLoading({
    Key? key,
    this.tamano = 50,
  }) : super(key: key);

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
