import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../widgets/my_text.dart';

class TurnoItemCircleLegend extends StatelessWidget {
  const TurnoItemCircleLegend({
    super.key,
    required this.title,
    this.colorCircle = Palette.primaryColor,
  });
  final String title;
  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
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
            title,
            fontWeight: FontWeight.w400,
            // fontSize: Constants.text5,
          ),
        ],
      ),
    );
  }
}
