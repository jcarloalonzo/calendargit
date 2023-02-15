import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SinDatosContainer extends StatelessWidget {
  final String text;
  // ignore: use_key_in_widget_constructors
  const SinDatosContainer({Key? key, this.text = 'No se encontro datos'});

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
