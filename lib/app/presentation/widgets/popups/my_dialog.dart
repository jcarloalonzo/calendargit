// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../config/app_config/size_text.dart';
import '../../../../generated/translations.g.dart';
import '../my_text.dart';

enum DialogAction { yes, abort }

class MyDialogs {
  const MyDialogs._();
  static Future<DialogAction> yesAbortDialog(
      {required BuildContext context,
      String? title,
      String? body,
      double height = 80,
      bool? onlyButtom = false}) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            elevation: 20,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Column(
              children: [
                const SizedBox(height: 10),
                MyText(
                  title ?? texts.label.attention,
                  color: Palette.blue,
                  textAlign: TextAlign.center,
                  size: SizeText.text4,
                  fontWeight: FontWeight.w800,
                ),
                const Divider(color: Palette.blue, thickness: 0.9),
              ],
            ),
            titlePadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            content: Builder(
              builder: (context) {
                return SizedBox(
                  width: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 07),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: MyText(
                                  body ?? '',
                                  maxLines: 8,
                                  textAlign: TextAlign.center,
                                  color: Palette.blue,
                                  size: SizeText.text5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            actions: [
              if (!onlyButtom!)
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(DialogAction.abort);
                    },
                    child: const MyText(
                      'No',
                      fontWeight: FontWeight.w800,
                      color: Palette.blue,
                    )),
              if (!onlyButtom)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogAction.yes);
                  },
                  child: MyText(
                    texts.label.yes,
                    fontWeight: FontWeight.w800,
                    color: Palette.blue,
                  ),
                ),
              if (onlyButtom)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogAction.yes);
                  },
                  child: const MyText(
                    'Ok',
                    fontWeight: FontWeight.w800,
                    color: Palette.blue,
                  ),
                ),
            ],
          ),
        );
      },
    );
    return action ?? DialogAction.abort;
  }
}
