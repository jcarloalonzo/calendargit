// ignore_for_file: prefer_const_constructors
import 'package:calendario/data/models/entities/login_model.dart';
import 'package:calendario/data/preferences/preferences_user.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/schedule/schedule_body.dart';
import 'package:calendario/presentation/widgets/confirm_alternate.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final prefsUser = PreferencesUser();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final loginBloc = Provider.of<MainBloc>(context, listen: false);
      if (loginBloc.model == null) {
        if (prefsUser.userLoginResponse != null) {
          var a = loginModelFromJson(prefsUser.userLoginResponse!);
          final loginBloc = Provider.of<MainBloc>(context, listen: false);
          loginBloc.model = a;
        }
      }
      final bloc = Provider.of<ScheduleBloc>(context, listen: false);
      await bloc.initPage(login: loginBloc.model);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

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
      allAnchorwindow: true,
      isDrawer: false,
      isAppBar: false,
      backPageEnable: false,
      isLoading: bloc.isLoading,
      child: ScheduleBody(),
    );
  }
}
