import 'package:flutter/material.dart';

class Coloredtabbar extends Container implements PreferredSizeWidget {
  Coloredtabbar({required this.colornew,required this.tabbar, Key? key}) : super(key: key);

  final Color colornew;
  final TabBar tabbar;

  @override
  Size get preferredSize => tabbar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: colornew,
    child: tabbar,
  );
}