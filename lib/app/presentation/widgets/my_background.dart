import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import 'appbar.dart';
import 'drawer_menu.dart';

class MyBackGround extends StatelessWidget {
  const MyBackGround({
    super.key,
    this.child,
    this.bottomNavigator,
    this.titleAppBar,
    this.hintText,
    this.controller,
    this.onSubmit,
    this.onPressIcon,
    this.onPressTextField,
    this.bottomNavigatorBar,
    this.actions,
    this.isLeading = true,
    this.isDrawer = false,
    this.backPageEnable = true,
    this.onTapVoice,
    this.wFloatingActionButtom,
    this.backgroundColor = Palette.backgroundColor,
    this.isAppBar = true,
    //
    this.isPadding = true,
  });
  final Widget? child;
  final Widget? bottomNavigator;
  final Widget? wFloatingActionButtom;
  final bool isAppBar;
  final String? titleAppBar;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onSubmit;
  final Function()? onPressIcon;
  final Function()? onPressTextField;
  final Widget? bottomNavigatorBar;
  final List<Widget>? actions;
  final bool isDrawer;
  final bool isLeading;
  final bool backPageEnable;
  final Function()? onTapVoice;
  final Color? backgroundColor;

  //
  //
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: backPageEnable,
      child: Scaffold(
        bottomNavigationBar: bottomNavigatorBar,
        backgroundColor: backgroundColor,
        floatingActionButton: wFloatingActionButtom,
        appBar: (isAppBar)
            ? buildAppBar(
                title: titleAppBar,
                onPress: onPressIcon,
                isLeading: isLeading,
                actions: actions,
                isDrawer: isDrawer)
            : null,
        extendBody: true,
        drawer: isDrawer ? DrawerMenu() : null,
        body: Padding(
            padding: isPadding
                ? EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                : EdgeInsets.zero,
            child: child),
      ),
    );
  }
}
