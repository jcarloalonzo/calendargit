import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../core/config/palette.dart';
import '../../../widgets/show_loader.dart';
import '../schedule_bloc.dart';

class CalendarScheduleWidget extends StatefulWidget {
  const CalendarScheduleWidget({Key? key}) : super(key: key);

  @override
  State<CalendarScheduleWidget> createState() => _CalendarScheduleWidgetState();
}

class _CalendarScheduleWidgetState extends State<CalendarScheduleWidget> {
  // late CalendarAgendaController calendarAgendaControllerNotAppBar;
  @override
  void initState() {
    super.initState();
    // calendarAgendaControllerNotAppBar = CalendarAgendaController();
  }

  @override
  void dispose() {
    // calendarAgendaControllerNotAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ScheduleBloc>();

    return WeeklyDatePicker(
      selectedDigitBackgroundColor: Palette.colorApp,
      selectedDigitBorderColor: Palette.colorApp,
      selectedDay: bloc.dateTime, // DateTime
      enableWeeknumberText: false,
      changeDay: (p0) async {
        bloc.dateTime = p0;
        await Loader.showLoader(context, bloc.getBookingDate());
      },
    );
  }
}
