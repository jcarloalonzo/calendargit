import 'package:calendario/core/config/palette.dart';
import 'package:flutter/material.dart';


class MyIconButtomCircle extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final Color? colorIcon;
  final Color? colorBackground;

  const MyIconButtomCircle({
    Key? key,
    this.onTap,
    required this.icon,
    this.colorIcon = Palette.white,
    this.colorBackground = Palette.black2,
  }) : super(key: key);

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
