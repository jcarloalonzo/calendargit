// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../bloc/main_bloc.dart';
// import '../../widgets/my_background.dart';
// import 'home_bloc.dart';
// import 'home_body.dart';

// class HomePage extends StatelessWidget {
//   const HomePage._();
//   static String routeName = '/HomePage';

//   static Widget init(
//     BuildContext context,
//   ) {
//     final loginUser = context.read<MainBloc>().login!;
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => HomeBloc(
//             loginUser,
//           )..init(),
//         ),
//       ],
//       child: const HomePage._(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.watch<HomeBloc>();

//     return MyBackGround(
//       isAppBar: false,
//       isDrawer: false,
//       backPageEnable: false,
//       isLoading: bloc.isLoading,
//       child: HomeBody(),
//     );
//   }
// }
