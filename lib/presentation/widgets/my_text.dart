import 'package:calendario/core/config/size_text.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow textOverFLow;

  // ignore: use_key_in_widget_constructors
  const MyText({
    this.text = '',
    this.fontWeight = FontWeight.w400,
    this.size = SizeText.text5,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.textOverFLow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverFLow,

      maxLines: maxLines,

      softWrap: true,
      style: TextStyle(
        // height:1.5,
// inherit: true,
        fontFamily: 'Roboto',
        fontSize: (size),
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
