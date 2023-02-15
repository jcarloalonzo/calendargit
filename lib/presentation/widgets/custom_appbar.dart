import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? listaIcons;
  final bool centerTitle;
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.listaIcons,
    this.centerTitle = true,
  }) : super(key: key);

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
