import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/widgets/appbar.dart';
import 'package:calendario/presentation/widgets/drawer_menu.dart';
import 'package:calendario/presentation/widgets/my_custom_loading.dart';
import 'package:flutter/material.dart';

class MyBackGround extends StatelessWidget {
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
  final bool allAnchorwindow;
  final bool backPageEnable;
  final Function()? onTapVoice;
  final Color? backgroundColor;
  final bool isLoading;
  const MyBackGround(
      {Key? key,
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
      this.isDrawer = false,
      this.backPageEnable = true,
      this.allAnchorwindow = false,
      this.onTapVoice,
      this.wFloatingActionButtom,
      this.backgroundColor = Palette.backgroundColor,
      this.isLoading = false,
      this.isAppBar = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return backPageEnable;
      },
      child: Scaffold(
        bottomNavigationBar: bottomNavigatorBar,
        backgroundColor: backgroundColor,
        floatingActionButton: wFloatingActionButtom,
        appBar: (isAppBar)
            ? buildAppBar(
                title: titleAppBar,
                onPress: onPressIcon,
                actions: actions,
                isDrawer: isDrawer)
            : null,
        extendBody: true,
        drawer: (isDrawer) ? DrawerMenu() : null,
        body: (isLoading)
            ? const MyCustomLoading()
            : Container(
                margin: (allAnchorwindow)
                    ? EdgeInsets.zero
                    :const EdgeInsets.symmetric(horizontal: 20),
                child: child),
      ),
    );
  }
}
