import 'package:flutter/material.dart';

import '../../core/config/palette.dart';

class MyIconButtomCircle extends StatelessWidget {
  const MyIconButtomCircle({
    Key? key,
    this.onTap,
    required this.icon,
    this.colorIcon = Palette.white,
    this.colorBackground = Palette.black2,
  }) : super(key: key);
  final Function()? onTap;
  final IconData icon;
  final Color? colorIcon;
  final Color? colorBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colorBackground,
        child: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}
