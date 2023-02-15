import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class TurnoItemCircle extends StatelessWidget {
  final String title;
  final Color? colorCircle;
  const TurnoItemCircle({
    Key? key,
    required this.title,
    this.colorCircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 6),
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: colorCircle,
            shape: BoxShape.circle,
          ),
        ),
        MyText(
          text: title,
          fontWeight: FontWeight.w400,
          size: SizeText.text5,
        ),
      ],
    );
  }
}

class ListTurnColorWidget extends StatelessWidget {
  const ListTurnColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          TurnoItemCircle(
            title: 'Disponible',
            colorCircle: Palette.green3,
          ),
          SizedBox(width: 20),
          TurnoItemCircle(
            title: 'No Disponible',
            colorCircle: Palette.grey4,
          ),
          SizedBox(width: 20),
          TurnoItemCircle(
            title: 'Seleccionado',
            colorCircle: Palette.blue1,
          ),
        ],
      ),
    );
  }
}
