// // ignore_for_file: prefer_const_constructors

// import 'package:calendario/core/config/config.dart';
// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/data/models/entities/agent_model.dart';
// import 'package:calendario/presentation/widgets/background_page.dart';
// import 'package:calendario/presentation/widgets/icon_svg_buttom_appbar.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:flutter/material.dart';

// class AgendaDetails extends StatelessWidget {
//   static String routeName = "/agendaDetails";
//   final BookingAgentModel? model;

//   const AgendaDetails({Key? key, this.model}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundPage(
//       // visiblebottomNavigationBar: false,
//       title: 'Reserva Online',
//       listaActions: [
//         IconSvgButtomAppbar(
//           svg: 'assets/svg/share.svg',
//           colorSvg: Palette.green1,
//           onPress: () {
//             //

//             //
//           },
//         ),
//         IconSvgButtomAppbar(
//           svg: 'assets/svg/x.svg',
//           colorSvg: Colors.red,
//           onPress: () {
//             //
//             //
//           },
//         ),
//       ],
//       child: Column(
//         children: [
//           // SizedBox(height: 50),
//           //
//           // Row(
//           //   // ignore: prefer_const_literals_to_create_immutables
//           //   children: [
//           //     Icon(Icons.radio_button_on_rounded),
//           //     SizedBox(width: 20),
//           //     MyText(
//           //       text: model!.bookingState,
//           //     )
//           //   ],
//           // ),
//           // SizedBox(height: 30),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.date_range),
//               SizedBox(width: 20),
//               MyText(
//                 text: Config.formatDate(model!.date, 'dd/MM/yyyy'),
//               )
//             ],
//           ),
//           SizedBox(height: 30),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.lock_clock),
//               SizedBox(width: 20),
//               MyText(
//                 text: 'Inicio',
//               ),
//               SizedBox(width: 20),
//               MyText(
//                 text: model!.initialTime,
//               ),
//             ],
//           ),
//           Row(
//             children: const [
//               SizedBox(height: 30, child: VerticalDivider(color: Colors.black)),
//             ],
//           ),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.lock_clock),
//               SizedBox(width: 20),
//               MyText(
//                 text: 'Fin',
//               ),
//               SizedBox(width: 20),
//               MyText(
//                 text: model!.finalTime,
//               ),
//             ],
//           ),
//           SizedBox(height: 30),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.person),
//               SizedBox(width: 20),
//               MyText(
//                 text: model!.name,
//               ),
//             ],
//           ),
//           SizedBox(height: 30),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.phone),
//               SizedBox(width: 20),
//               MyText(
//                 text: model!.phoneNumber ?? '',
//               ),
//             ],
//           ),
//           SizedBox(height: 30),
//           Row(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               Icon(Icons.money),
//               SizedBox(width: 20),
//               MyText(
//                 text: Config.numberFormat.format(100.00),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
