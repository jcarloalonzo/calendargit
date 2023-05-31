import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../schedule_bloc.dart';

class CalendarScheduleWidget extends StatefulWidget {
  const CalendarScheduleWidget({Key? key}) : super(key: key);

  @override
  State<CalendarScheduleWidget> createState() => _CalendarScheduleWidgetState();
}

class _CalendarScheduleWidgetState extends State<CalendarScheduleWidget> {
  late CalendarAgendaController calendarAgendaControllerNotAppBar;
  @override
  void initState() {
    super.initState();
    calendarAgendaControllerNotAppBar = CalendarAgendaController();
  }

  @override
  void dispose() {
    calendarAgendaControllerNotAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ScheduleBloc>();

    return Container(
      color: Colors.transparent,
      height: 100,
      child: CalendarAgenda(
        fullCalendar: false,
        backgroundColor: Colors.transparent,
        controller: calendarAgendaControllerNotAppBar,
        locale: 'es',
        weekDay: WeekDay.short,
        fullCalendarScroll: FullCalendarScroll.vertical,
        fullCalendarDay: WeekDay.short,
        selectedDateColor: Palette.blue6,
        leftMargin: 0,
        dateColor: Colors.black,
        padding: 0,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().add(const Duration(days: -3)),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        calendarBackground: Colors.black,
        calendarEventColor: Colors.black,
        calendarEventSelectedColor: Palette.blue6,
        appbar: false,
        selectedDayPosition: SelectedDayPosition.center,
        onDateSelected: (date) async {
          bloc.fechaSelected = MyUtils.formatDate(date);
          await bloc.getBookingsPickDate();
        },
      ),
    );
  }
}
