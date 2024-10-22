import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/size_text.dart';
import 'my_text.dart';

class MyTextSubtitle extends StatelessWidget {
  const MyTextSubtitle(
    this.text, {
    super.key,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return MyText(
      text,
      fontWeight: FontWeight.w600,
      color: Palette.colorApp,
      size: SizeText.text2,
      textAlign: TextAlign.start,
    );
  }
}
