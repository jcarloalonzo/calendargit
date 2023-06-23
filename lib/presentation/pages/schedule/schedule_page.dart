// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/entities/response_model.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_background.dart';
import 'schedule_bloc.dart';
import 'schedule_body.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage._();
  static String routeName = '/SchedulePage';

  static Widget init(BuildContext context) {
    final loginUser = context.read<MainBloc>().login!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleBloc(loginUser)..init()),
      ],
      child: const SchedulePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ScheduleBloc>();
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      allAnchorwindow: true,
      isDrawer: false,
      isAppBar: false,
      backPageEnable: false,
      isLoading: bloc.isLoading,
      child: ScheduleBody(),
    );
  }
}
