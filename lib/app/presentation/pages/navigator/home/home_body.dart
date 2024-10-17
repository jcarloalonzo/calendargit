import 'package:flutter/material.dart';

import '../../../blocs/navigator/home/screen_model/home_screen_model.dart';
import 'components/cabecera_schedule_container.dart';
import 'components/calendar_schedule_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.model});
  final HomeScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CabeceraScheduleContainer(date: model.date),
        CalendarScheduleWidget(date: model.date),
      ],
    );
  }
}
