import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../config/app_config/palette.dart';

class Loader {
  Loader._();
  static Future showLoader<T>(BuildContext context, Future<T> future) async {
    final overlayState = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      maintainState: true,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withAlpha(100),
              child: const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                      color: Palette.primaryColor, strokeWidth: 5),
                ),
              ),
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
