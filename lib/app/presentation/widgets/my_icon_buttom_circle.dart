import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';

class MyIconButtomCircle extends StatelessWidget {
  const MyIconButtomCircle({
    super.key,
    this.onTap,
    required this.icon,
    this.colorIcon = Palette.white,
    this.colorBackground = Palette.black2,
  });
  final Function()? onTap;
  final IconData icon;
  final Color? colorIcon;
  final Color? colorBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: colorBackground,
        child: Icon(
          icon,
          color: colorIcon,
          size: 30,
        ),
      ),
    );
  }
}
