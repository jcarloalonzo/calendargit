import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/size_text.dart';
import 'icon_svg_buttom.dart';
import 'my_text.dart';

AppBar buildAppBar(
    {String? title,
    Function()? onPress,
    bool isDrawer = false,
    bool isLeading = true,
    List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Palette.primaryColor,
    toolbarHeight: 50,
    iconTheme: IconThemeData(color: Colors.white),
    leading: _returnLeading(isDrawer, isLeading),
    centerTitle: true,
    title: MyText(
      title ?? '',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      size: SizeText.text4,
    ),
    actions: actions,
  );
}

Widget? _returnLeading(bool isDrawer, bool isLeading) {
  if (!isLeading) return const SizedBox();
  (isDrawer)
      ? Builder(builder: (context) {
          return IconSvgButtom(
            svg: 'assets/svg/menu_hamburguesa.svg',
            sizeSvg: 15,
            colorSvg: Colors.white,
            onPress: () => Scaffold.of(context).openDrawer(),
          );
        })
      // ignore: unnecessary_statements
      : null;

  return null;
}
