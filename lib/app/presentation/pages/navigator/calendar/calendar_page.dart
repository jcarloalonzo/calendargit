import 'package:flutter/material.dart';

import 'calendar_body.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CalendarBody(),
    );
  }
}