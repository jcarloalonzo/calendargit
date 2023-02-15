import 'package:calendario/data/models/entities/response_model.dart';
import 'package:flutter/material.dart';

class ConfirmAlternant {
  final BuildContext context;
  final Function action;
  final bool back;
  ConfirmAlternant(
      {required this.context, required this.action, this.back = true});

  Future<Widget?> confirmDialogBack(String headMsn, String msn, String confirm,
      String cancel, double heigth) {
    double sizeOption = 14.0;
    final textStyleOption = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: sizeOption,
      fontFamily: "Source Sans Pro",
    );
    // final padding = EdgeInsets.symmetric(horizontal: 15);

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
              onWillPop: () async {
                return Future.value(false);
              },
              child: Dialog(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  height: heigth,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            //padding: padding,
                            height: 40,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    headMsn,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: "Source Sans Pro"),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SizedBox(
                          // padding: padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                msn,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 50,
                                style: const TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 50,
                            // padding: padding,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(_).pop();
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            confirm,
                                            textAlign: TextAlign.center,
                                            style: textStyleOption,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (back) Navigator.of(_).pop();
                                      action();
                                    },
                                    child: SizedBox(
                                      height: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            cancel,
                                            textAlign: TextAlign.center,
                                            style: textStyleOption,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}

class ContentSucess extends StatelessWidget {
  final String text;

  const ContentSucess({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleSubText = TextStyle(
      fontSize: 12,
      color: Color(0xff666666),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
    );
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: styleSubText,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ]),
              );
            }));
  }
}

ConfirmAlternant confirmAlternantError(
    {required BuildContext context,
    required ResponseErrorModel errormodel,
    required int statuscode}) {
  return ConfirmAlternant(context: context, action: () {})
    ..confirmDialogBack(
        statuscode == 500 ? 'Ocurrió un error' : 'Advertencia',
        statuscode == 500
            ? 'Ha ocurrido un error inesperado o el servidor no responde. Por favor, ponte en contacto con nosotros para ayudarte.'
            : '${errormodel.message}. Si crees que esto es un error, por favor solicita ayuda.',
        "",
        "ACEPTAR",
        180.0);
}
