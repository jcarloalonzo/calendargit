import 'package:flutter/material.dart';

import '../../core/config/palette.dart';
import 'my_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.listaIcons,
    this.centerTitle = true,
  }) : super(key: key);
  final String title;
  final List<Widget>? listaIcons;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: MyText(
        text: title,
        fontWeight: FontWeight.w900,
        color: Palette.blue1,
        size: 18,
      ),
      backgroundColor: Colors.transparent,
      // brightness: Brightness.light,
      centerTitle: centerTitle,
      // leading: Builder(builder: (context) {
      //   return IconSvgButtomAppbar(
      //     svg: 'assets/svg/menu.svg',
      //     colorSvg: Colors.white,
      //     onPress: () => Scaffold.of(context).openDrawer(),
      //   );
      // }),
      actions: listaIcons,
    );
  }
}
