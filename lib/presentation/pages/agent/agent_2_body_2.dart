// import 'package:calendario/core/config/config.dart';
// import 'package:calendario/presentation/bloc/agent_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'agent_widgets.dart';

// class AgentBody extends StatelessWidget {
//   const AgentBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<AgentModelProvider>(context, listen: true);
//     String date = '';

//     List<Widget> data = [];

//     date = bloc.servicelist.isEmpty
//         ? ''
//         : Config.formatDate(bloc.servicelist[0].date, 'dd/MM/yyyy');

//     for (var i = 0; i < bloc.servicelist.length; i++) {
//       if (i == 0 ||
//           date != Config.formatDate(bloc.servicelist[i].date, 'dd/MM/yyyy')) {
//         date = Config.formatDate(bloc.servicelist[i].date, 'dd/MM/yyyy');
//         data.add(Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: HearRowAgent(
//             date: Config.formatDate(bloc.servicelist[i].date, 'dd/MM/yyyy'),
//           ),
//         ));
//       }
//       data.add(Column(
//         children: [
//           // ListTileAgent(
//           //   colorStatus: Config.statusColor(bloc.servicelist[i].bookingStateId),
//           //   hour: bloc.servicelist[i].initialTime,
//           //   subTitle: bloc.servicelist[i].name,
//           //   title: bloc.servicelist[i].serviceDescription,
//           //   onPressIcon: () async {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => BookingPage.init(
              //         context,
              //         bloc.servicelist[i].bookingId,
              //       ),
              //     ));

//           //     // print(bloc.servicelist[i].bookingId);
//           //   },
//           // ),

//           ListTileAgent(
//             obj: bloc.servicelist[i],
//           ),
//           const Divider()
//         ],
//       ));
//     }

//     return Column(
//       children: [
//         const SizedBox(height: 15),
//         const BuildDropDown(),
//         const SizedBox(height: 15),
//         SingleChildScrollView(child: Column(children: data)),
//         const SizedBox(height: 80),
//       ],
//     );
//   }
// }
