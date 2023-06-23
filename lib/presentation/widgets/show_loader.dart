import 'package:flutter/material.dart';

import '../../core/config/palette.dart';

class Loader {
  Loader._();
  static Future showLoader<T>(BuildContext context, Future<T> future) async {
    final overlayState = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withAlpha(150),
          // color: Colors.black45,
          child: const Center(
            child: CircularProgressIndicator(
              color: Palette.primaryColor,
            ),
          ),
        );
      },
    );
    overlayState.insert(overlayEntry);
    final result = await future;
    overlayEntry.remove();
    return result;
  }
}
