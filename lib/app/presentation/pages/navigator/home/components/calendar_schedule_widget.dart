import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../blocs/navigator/home/home_bloc.dart';
import '../../../../widgets/util/loader.dart';

class CalendarScheduleWidget extends StatelessWidget {
  const CalendarScheduleWidget({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<ScheduleBloc>();

    return WeeklyDatePicker(
      selectedDigitBackgroundColor: Palette.colorApp,
      selectedDigitBorderColor: Palette.colorApp,
      selectedDay: date, // DateTime
      enableWeeknumberText: false,
      changeDay: (date) => _changeDate(context, date),
    );
  }

  void _changeDate(BuildContext context, DateTime date) async {
    final bloc = context.read<HomeBloc>();
    bloc.setDate(date);
    await Loader.showLoader(context, bloc.getBookingDate());
  }
}
