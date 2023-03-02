// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../core/config/palette.dart';
import '../../core/config/size_text.dart';
import 'my_text.dart';

enum DialogAction { yes, abort }

class MyDialogs {
  static Future<DialogAction?> yesAbortDialog(
      {required BuildContext context,
      String? title,
      String? body,
      double height = 80,
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
              const SizedBox(height: 10),
              MyText(
                text: title ?? '',
                color: Palette.blue,
                textAlign: TextAlign.center,
                size: SizeText.text4,
                fontWeight: FontWeight.w800,
              ),
              const Divider(color: Palette.blue, thickness: 0.9),
            ],
          ),
          titlePadding: EdgeInsets.zero,
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.

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
                                text: body ?? '',
                                maxLines: 4,
                                textAlign: TextAlign.center,
                                color: Palette.blue,
                                size: SizeText.text5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // const SizedBox(height: 07),
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
              // MyButtom(
              //   text: 'No',
              //   onTap: () {
              //     Navigator.of(context).pop(DialogAction.abort);
              //   },
              // ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogAction.abort);
                  },
                  child: const MyText(
                    text: 'NO',
                    fontWeight: FontWeight.w800,
                    color: Palette.blue,
                  )),

            // FlatButton(
            //   onPressed: () => Navigator.of(context).pop(DialogAction.abort),
            //   child: const Text('No'),
            // ),
            if (!onlyButtom)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogAction.yes);
                },
                child: const MyText(
                  text: 'SI',
                  fontWeight: FontWeight.w800,
                  color: Palette.blue,
                ),
              ),
            // MyButtom(
            //   text: 'Yes',
            //   onTap: () {
            //     Navigator.of(context).pop(DialogAction.yes);
            //   },
            // ),

            if (onlyButtom)
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogAction.yes);
                  },
                  child: const Text('OK')),

            // MyButtom(
            //   text: 'OK',
            //   onTap: () {
            //     Navigator.of(context).pop(DialogAction.yes);
            //   },
            // ),
          ],
        );
      },
    );

    return (action != null) ? action : DialogAction.abort;
  }
//
//
//
//
//
//
//
// //

//   static Future<DialogAction?> yesAbortDialogState(
//       {required BuildContext context,
//       String? title,
//       String? body,
//       bool? onlyButtom = false}) async {
//     final action = await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           buttonPadding: EdgeInsets.zero,
//           contentPadding: EdgeInsets.zero,
//           elevation: 20,
//           insetPadding: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           title: Column(
//             children: [
//               const SizedBox(height: 10),
//               // MyText(
//               //   text: title ?? '',
//               //   color: Palette.blue,
//               //   textAlign: TextAlign.center,
//               //   size: SizeText.text4,
//               //   fontWeight: FontWeight.w800,
//               // ),
//               // Divider(
//               //   color: Palette.blue,
//               // ),
//               TextButton(onPressed: () {}, child: const Text('text')),
//               TextButton(onPressed: () {}, child: const Text('text')),
//             ],
//           ),
//           titlePadding: EdgeInsets.zero,
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               // Get available height and width of the build area of this widget. Make a choice depending on the size.
//               var height = MediaQuery.of(context).size.height;
//               var width = MediaQuery.of(context).size.width;

//               return _MyDialogWithState(
//                 width: width,
//                 height: height,
//                 body: body,
//               );
//             },
//           ),
//           actions: [
//             if (!onlyButtom!)
//               // MyButtom(
//               //   text: 'No',
//               //   onTap: () {
//               //     Navigator.of(context).pop(DialogAction.abort);
//               //   },
//               // ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(DialogAction.abort);
//                   },
//                   child: const MyText(
//                     text: 'NO',
//                     fontWeight: FontWeight.w800,
//                     color: Palette.blue,
//                   )),

//             // FlatButton(
//             //   onPressed: () => Navigator.of(context).pop(DialogAction.abort),
//             //   child: const Text('No'),
//             // ),
//             if (!onlyButtom)
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(DialogAction.yes);
//                 },
//                 child: const MyText(
//                   text: 'SI',
//                   fontWeight: FontWeight.w800,
//                   color: Palette.blue,
//                 ),
//               ),
//             // MyButtom(
//             //   text: 'Yes',
//             //   onTap: () {
//             //     Navigator.of(context).pop(DialogAction.yes);
//             //   },
//             // ),

//             if (onlyButtom)
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(DialogAction.yes);
//                   },
//                   child: const Text('OK')),

//             // MyButtom(
//             //   text: 'OK',
//             //   onTap: () {
//             //     Navigator.of(context).pop(DialogAction.yes);
//             //   },
//             // ),
//           ],
//         );
//       },
//     );

//     return (action != null) ? action : DialogAction.abort;
//   }
// }

//
//
//
//
//

//
//
//
// //

// class _MyDialogWithState extends StatefulWidget {
//   const _MyDialogWithState({
//     Key? key,
//     required this.height,
//     required this.width,
//     this.body,
//   }) : super(key: key);

//   final double height;
//   final String? body;
//   final double width;
//   final bool? loading;
//   @override
//   State<_MyDialogWithState> createState() => _MyDialogWithStateState();
// }

// class _MyDialogWithStateState extends State<_MyDialogWithState> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       // final productService =
//       //     Provider.of<ProductService>(context, listen: false);

//       // _descuentoController.text = 0.toString();
//       // _pagoController.text = productService.totalFinal.toString();
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();

//     // _descuentoController.dispose();
//     // _pagoController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final bloc = Provider.of<FacturaService>(context, listen: true);
//     // final companyService = Provider.of<CompanyService>(context, listen: true);
//     // final productService = Provider.of<ProductService>(context, listen: true);
//     return SizedBox(
//       height: widget.height * 0.1,
//       width: widget.width * 0.8,
//       // obj: invoiceDet,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: MyText(
//               text: widget.body ?? '',
//               maxLines: 4,
//               textAlign: TextAlign.start,
//               color: Palette.blue,
//               size: SizeText.text5,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           if (widget.loading!) const MyCustomLoading(tamano: 30),
//         ],
//       ),
//     );
//   }
// }
}
