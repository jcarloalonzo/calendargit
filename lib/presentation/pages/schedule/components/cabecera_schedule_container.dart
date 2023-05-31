import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_text.dart';

class CabeceraScheduleContainer extends StatelessWidget {
  const CabeceraScheduleContainer({Key? key, required this.fechaSelected})
      : super(key: key);
  final String fechaSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          MyText(
            text: Jiffy(fechaSelected).format('d'),
            color: Palette.white,
            size: 70,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: MyUtils.firstUpper(Jiffy(fechaSelected).EEEE),
                color: Palette.white,
                size: SizeText.text4 + 1,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 5),
              MyText(
                text: MyUtils.firstUpper(
                    Jiffy(fechaSelected).format('MMMM yyyy')),
                color: Palette.white,
                size: SizeText.text4 + 1,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
