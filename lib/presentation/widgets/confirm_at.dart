import 'package:flutter/material.dart';

import '../../core/config/palette.dart';

class ConfirmAt {
  ConfirmAt(
      {required this.context, required this.action, required this.content});
  final BuildContext context;
  final Function action;
  final Widget content;

  Future<Widget?> confirmDialogBack(
      String headMsn, String? confirm, double height,
      {bool refresh = false, String imageIcon = ''}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          final width = MediaQuery.of(context).size.width;
          double padding = 20.0;

          return Dialog(
            insetPadding: EdgeInsets.all(padding),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: height,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            //color: Colors.teal,
                            border: Border.all(color: Colors.black12)),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                headMsn,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  fontFamily: 'Source Sans Pro',
                                ),
                              )
                            ]),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(_).pop();
                                  if (refresh) {
                                    action();
                                  }
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                  content,
                  if (confirm != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(_).pop();
                        action();
                      },
                      child: Container(
                        width: width * 0.5132,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Palette.primaryColor,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (imageIcon != '')
                              Image.asset(
                                imageIcon,
                                width: 30,
                                color: Colors.white,
                              ),
                            if (imageIcon != '')
                              const SizedBox(
                                width: 10.0,
                              ),
                            Text(
                              confirm,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Source Sans Pro',
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }
}
