import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/calendar_bloc.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/confirm_alternate.dart';
import '../../widgets/my_background.dart';
import 'calendar_body.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  static String routeName = '/CalendarPage';

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final blocLogin = Provider.of<MainBloc>(context, listen: false);
      final bloc = Provider.of<CalendarBloc>(context, listen: false);

      await bloc.initPage(login: blocLogin.login, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CalendarBloc>(context, listen: true);

    if (bloc.error != null) {
      if (bloc.error!.statusCode != 200) {
        Future.delayed(Duration.zero, () async {
          confirmAlternantError(
              context: context,
              errormodel: bloc.error!.error!,
              statuscode: bloc.error!.statusCode!);
          bloc.error = null;
        });
      }
    }

    return MyBackGround(
      isAppBar: false,
      backPageEnable: false,
      isLoading: bloc.isLoading,
      allAnchorwindow: true,
      // wFloatingActionButtom: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      child: const CalendarBody(),
    );
  }
}
