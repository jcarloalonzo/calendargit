import 'package:calendario/presentation/bloc/calendar_bloc.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/pages/calendar/calendar_body.dart';
import 'package:calendario/presentation/widgets/confirm_alternate.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatefulWidget {
  static String routeName = "/CalendarPage";

  const CalendarPage({Key? key}) : super(key: key);

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

      await bloc.initPage(login: blocLogin.model, context: context);
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
      wFloatingActionButtom: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      child: Column(
        children: const [
          CalendarBody(),
        ],
      ),
    );
  }
}
