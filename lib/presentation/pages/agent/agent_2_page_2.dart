// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/presentation/bloc/agent_bloc.dart';
// import 'package:calendario/presentation/bloc/login_bloc.dart';
// import 'package:calendario/presentation/widgets/background_page.dart';
// import 'package:calendario/presentation/widgets/confirm_alternate.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'agent_2_body_2.dart';

// class AgentPage extends StatefulWidget {
//   static String routeName = "/AgentPage";

//   const AgentPage({Key? key}) : super(key: key);

//   @override
//   State<AgentPage> createState() => _AgentPageState();
// }

// class _AgentPageState extends State<AgentPage> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       final blocLogin = Provider.of<MainBloc>(context, listen: false);
//       final bloc = Provider.of<AgentModelProvider>(context, listen: false);

//       await bloc.init(
//           businessID: blocLogin.modelBusiness!.businessId,
//           personID: blocLogin.model!.personID,
//           type: Typehorario.semana);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<AgentModelProvider>(context, listen: true);

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
//     return BackgroundPage(
//       isAppBar: true,
//       title: 'Mi agenda',
//       listaActions: const [ButtomWidget()],
//       isDrawer: true,
//       child: bloc.charge
//           ? const Center(child: CircularProgressIndicator())
//           : const SingleChildScrollView(child: AgentBody()),
//       // child: ElevatedButton(
//       //   child: const Text('text'),
//       //   onPressed: (){},
//       // ),
//     );
//   }
// }

// class ButtomWidget extends StatelessWidget {
//   const ButtomWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (_) => Center(
//               // Aligns the container to center
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 padding: const EdgeInsets.all(15),
//                 // A simplified version of dialog.
//                 width: 250.0,
//                 height: 250.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     const MyText(
//                       text: 'Información',
//                       fontWeight: FontWeight.w700,
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: const [
//                         Icon(
//                           Icons.check_circle_sharp,
//                           color: Palette.statusxconfirmar,
//                         ),
//                         SizedBox(width: 10),
//                         MyText(
//                           fontWeight: FontWeight.w400,
//                           text: 'Cita Pendiente',
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.check_circle_sharp,
//                           color: Palette.statuscompletada,
//                         ),
//                         SizedBox(width: 10),
//                         MyText(
//                           fontWeight: FontWeight.w400,
//                           text: 'Cita Completada',
//                         )
//                       ],
//                     ),

//                     const SizedBox(height: 4),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.check_circle_sharp,
//                           color: Palette.statuscancelada,
//                         ),
//                         SizedBox(width: 10),
//                         MyText(
//                           text: 'Cita Anulada',
//                           fontWeight: FontWeight.w400,
//                         )
//                       ],
//                     ),
//                     //
//                     const SizedBox(height: 4),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.check_circle_sharp,
//                           color: Palette.statusReprogramada,
//                         ),
//                         SizedBox(width: 10),
//                         MyText(
//                           fontWeight: FontWeight.w400,
//                           text: 'Cita Reprogramada',
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.check_circle_sharp,
//                           color: Palette.statusinvoice,
//                         ),
//                         SizedBox(width: 10),
//                         MyText(
//                           fontWeight: FontWeight.w400,
//                           text: 'Cita Facturada',
//                         )
//                       ],
//                     ),
//                     //
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         icon: Icon(Icons.info_outline));
//   }
// }
