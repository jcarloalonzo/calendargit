import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';

class MyCardContainer extends StatelessWidget {
  const MyCardContainer(
      {super.key,
      this.child,
      this.padding = true,
      this.elevation = 2,
      this.backgroundColor = Palette.white});
  final bool padding;
  final Widget? child;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: (padding) ? const EdgeInsets.all(14) : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
