import 'package:flutter/material.dart';

import 'my_text.dart';

class MessageObservationText extends StatelessWidget {
  const MessageObservationText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return MyText(
      title,
      maxLines: 10,
      size: 16,
      fontWeight: FontWeight.w300,
    );
  }
}
