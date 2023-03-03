import 'package:flutter/material.dart';

import '../../core/config/palette.dart';

class MyCircleIconButtom extends StatelessWidget {
  const MyCircleIconButtom({
    Key? key,
    this.onTap,
    required this.icon,
    this.iconColor = Palette.colorApp,
    this.backgroundColor = Palette.white,
  }) : super(key: key);
  final VoidCallback? onTap;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: backgroundColor,
      child: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: const Color(0xffDDDDDD),
            width: 1.0,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
