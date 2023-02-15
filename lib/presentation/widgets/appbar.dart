import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/widgets/icon_svg_buttom_appbar.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(
    {String? title,
    Function()? onPress,
    bool isDrawer = false,
    List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Palette.colorApp,
    toolbarHeight: 50,
    leading: (isDrawer)
        ? Builder(builder: (context) {
            return IconSvgButtomAppbar(
              svg: 'assets/svg/menu_hamburguesa.svg',
              sizeSvg: 15,
              colorSvg: Colors.white,
              onPress: () => Scaffold.of(context).openDrawer(),
            );
          })
        : null,
    centerTitle: true,
    title: MyText(
      text: title ?? '',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      size: SizeText.text4,
    ),
    actions: actions,
  );
}
