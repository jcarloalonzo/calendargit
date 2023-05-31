// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../data/preferences/preferences_user.dart';
// import '../../bloc/main_bloc.dart';
// import '../../bloc/schedule_bloc.dart';
// import '../../widgets/confirm_alternate.dart';
// import '../../widgets/my_background.dart';
// import 'schedule_body.dart';

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({Key? key}) : super(key: key);

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   final prefsUser = PreferencesUser();

//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () async {
//       final loginBloc = Provider.of<MainBloc>(context, listen: false);
//       // if (loginBloc.login == null) {
//       //   if (prefsUser.user != null) {
//       //     var a = LoginResponse.loginModelFromJson(prefsUser.user!);
//       //     final loginBloc = Provider.of<MainBloc>(context, listen: false);
//       //     loginBloc.login = a;
//       //   }
//       // }
//       final bloc = Provider.of<ScheduleBloc>(context, listen: false);
//       await bloc.initPage(login: loginBloc.login);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<ScheduleBloc>(context, listen: true);

//     if (bloc.error != null) {
//       if (bloc.error!.statusCode != 200) {
//         Future.delayed(Duration.zero, () async {
//           confirmAlternantError(
//               context: context,
//               errormodel: bloc.error!.error!,
//               statuscode: bloc.error!.statusCode!);
//           bloc.error = null;
//         });
//       }
//     }

//     return MyBackGround(
//       allAnchorwindow: true,
//       isDrawer: false,
//       isAppBar: false,
//       backPageEnable: false,
//       isLoading: bloc.isLoading,
//       child: ScheduleBody(),
//     );
//   }
// }
