// ignore_for_file: deprecated_member_use

import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

enum DialogsAlerts { yes, abort }

class MyAlerts {
  static Future<DialogsAlerts?> sucess(
      {required BuildContext context,
      String? title,
      String? body,
      bool? onlyButtom = false,
      bool retrocede = false}) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
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
                text: title ?? 'Proceso Éxitoso',
                color: Palette.colorApp,
                textAlign: TextAlign.center,
                size: SizeText.text5 + 1,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return SizedBox(
                height: 120,
                width: width * 0.8,
                // obj: invoiceDet,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Icon(
                      Icons.check_circle_sharp,
                      color: Palette.green,
                      size: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: MyText(
                        text: body ?? '',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        color: Palette.colorApp,
                        size: SizeText.text5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: MyButtom(
                sizeText: SizeText.text5,
                text: 'Confirmar',
                height: 30,
                color: Palette.green,
                width: double.infinity,
                onTap: () {
                  Navigator.of(context).pop(DialogsAlerts.yes);
                },
              ),
            ),
          ],
        );
      },
    );

    return (action != null) ? action : DialogsAlerts.abort;
  }

  //
  //

  static Future<DialogsAlerts?> error(
      {required BuildContext context,
      String? title,
      String? body,
      bool? onlyButtom = false}) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          elevation: 20,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
          const    SizedBox(height: 10),
              MyText(
                text: title ?? 'Error',
                color: Palette.colorApp,
                textAlign: TextAlign.center,
                size: SizeText.text4,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return SizedBox(
                height: 140,
                width: width * 0.8,
                // obj: invoiceDet,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 const   SizedBox(height: 5),
                 const   Icon(
                      Icons.error_rounded,
                      color: Palette.red,
                      size: 80,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: MyText(
                        text: body ?? '',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        color: Palette.colorApp,
                        size: SizeText.text5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: MyButtom(
                text: 'Confirmar',
                color: Palette.red,
                width: double.infinity,
                onTap: () {
                  Navigator.of(context).pop(DialogsAlerts.abort);
                },
              ),
            ),
          ],
        );
      },
    );

    return (action != null) ? action : DialogsAlerts.abort;
  }

  //
  //
  static Future<DialogsAlerts?> warning(
      {required BuildContext context,
      String? title,
      String? body,
      bool? onlyButtom = false}) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          elevation: 20,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            children: [
           const   SizedBox(height: 10),
              MyText(
                text: title ?? 'Advertencia',
                color: Palette.colorApp,
                textAlign: TextAlign.center,
                size: SizeText.text4,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return SizedBox(
                height: 140,
                width: width * 0.8,
                // obj: invoiceDet,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const  SizedBox(height: 5),
                   const Icon(
                      Icons.warning_rounded,
                      color: Colors.yellow,
                      size: 80,
                    ),
                    Container(
                      margin:const EdgeInsets.all(10),
                      child: MyText(
                        text: body ?? '',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        color: Palette.colorApp,
                        size: SizeText.text5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: MyButtom(
                text: 'Confirmar',
                color: Colors.yellow,
                width: double.infinity,
                onTap: () {
                  Navigator.of(context).pop(DialogsAlerts.abort);
                },
              ),
            ),
          ],
        );
      },
    );

    return (action != null) ? action : DialogsAlerts.abort;
  }
}
