import 'package:flutter/material.dart';

// ============================
//  SHOW ALERT BUTTON DISMISS
// ============================

class MyLoading {

  final BuildContext context;

  MyLoading({ required this.context });

  void createLoading() {
  
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:   Center(
          child: CircularProgressIndicator(),
        ),
      )
    );

  }

  void dismiss() {

    Navigator.of(context).pop();

  }
  
}
