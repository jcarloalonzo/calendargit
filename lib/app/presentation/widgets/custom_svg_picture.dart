import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture(
    this.asset, {
    super.key, required this.size,
  });
  final String asset;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      // color: colorSvg,
      width: size,
      height: size,
    );
  }
}
