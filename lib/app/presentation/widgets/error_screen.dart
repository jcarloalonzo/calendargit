import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import '../../../generated/translations.g.dart';
import 'my_text.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.text, this.onRetry});
  final VoidCallback? onRetry;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(child: Assets.svg.error.svg()),
          MyText(
            text ?? texts.messages.anUnexpectedErrorOcurredPleaseTryAgain,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            size: 14,
            color: Palette.primaryColor,
            maxLines: 5,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: onRetry,
              color: Colors.white,
              child: Text(
                texts.label.retry,
                // color: Palette.white,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
