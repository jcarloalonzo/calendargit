import 'package:flutter/material.dart';

import '../../core/config/size_text.dart';
import 'my_text.dart';

class SinDatosContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SinDatosContainer({Key? key, this.text = 'No se encontro datos'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.8,
        child: Center(
            child: MyText(
          text: text,
          maxLines: 5,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          size: SizeText.text4,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
