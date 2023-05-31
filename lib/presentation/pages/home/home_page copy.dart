// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:provider/provider.dart';

// import '../../bloc/home_bloc.dart';
// import '../../bloc/main_bloc.dart';
// import '../../widgets/confirm_alternate.dart';
// import '../../widgets/my_background.dart';
// import 'home_body.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       await Jiffy.locale('es');

//       final blocLogin = Provider.of<MainBloc>(context, listen: false);
//       final bloc = Provider.of<HomeBloc>(context, listen: false);
//       await bloc.initPage(login: blocLogin.login);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<HomeBloc>(context, listen: true);

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
//       isAppBar: false,
//       isDrawer: false,
//       backPageEnable: false,
//       isLoading: bloc.isLoading,
//       child: HomeBody(),
//     );
//   }
// }
