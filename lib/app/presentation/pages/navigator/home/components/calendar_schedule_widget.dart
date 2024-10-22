import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../../config/app_config/palette.dart';

class CalendarScheduleWidget extends StatelessWidget {
  const CalendarScheduleWidget(
      {super.key, required this.date, required this.onTapDate});
  final DateTime date;
  final Function(DateTime) onTapDate;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<ScheduleBloc>();

    return WeeklyDatePicker(
      selectedDigitBackgroundColor: Palette.colorApp,
      selectedDigitBorderColor: Palette.colorApp,
      selectedDay: date, // DateTime
      enableWeeknumberText: false,
      // changeDay: (date) => _changeDate(context, date),
      changeDay: onTapDate,
    );
  }
}
