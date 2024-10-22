import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import 'my_text.dart';

class MyTextLabel extends StatelessWidget {
  const MyTextLabel(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return MyText(
      text,
      fontWeight: FontWeight.w500,
      color: Palette.colorApp,
      size: 16,
      textAlign: TextAlign.start,
    );
  }
}
