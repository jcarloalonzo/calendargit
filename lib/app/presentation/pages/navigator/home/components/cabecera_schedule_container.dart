import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/helpers/helpers.dart';
import '../../../../widgets/my_text.dart';

class CabeceraScheduleContainer extends StatelessWidget {
  const CabeceraScheduleContainer({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Palette.colorApp,
      // height: 100,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                MyText(
                  Jiffy.parseFromDateTime(date).format(pattern: 'd'),
                  color: Palette.white,
                  size: 70,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      Helpers.firstUpper(Jiffy.parseFromDateTime(date).EEEE),
                      color: Palette.white,
                      size: SizeText.text4 + 1,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      Helpers.firstUpper(Jiffy.parseFromDateTime(date)
                          .format(pattern: 'MMMM yyyy')),
                      color: Palette.white,
                      size: SizeText.text4 + 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.date_range,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
