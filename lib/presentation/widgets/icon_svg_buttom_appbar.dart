import 'package:calendario/core/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSvgButtomAppbar extends StatelessWidget {
  final String svg;
  final Function()? onPress;
  final Color colorSvg;
  final double sizeSvg;

  // ignore: use_key_in_widget_constructors
  const IconSvgButtomAppbar({
    required this.svg,
    this.onPress,
    this.colorSvg = Palette.blue2,
    this.sizeSvg = 20.0,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(
          svg,
          color: colorSvg,
          width: sizeSvg,
          height: (sizeSvg),
        ),
        onPressed: onPress);
  }
}
 