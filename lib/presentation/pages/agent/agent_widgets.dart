// // ignore_for_file: avoid_print

// import 'package:calendario/core/config/Utils.dart';
// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/core/config/size_text.dart';
// import 'package:calendario/data/models/entities/agent_model.dart';
// import 'package:calendario/data/models/entities/booking.dart';
// import 'package:calendario/data/models/entities/dropdown_model.dart';
// import 'package:calendario/presentation/bloc/agenda_bloc.dart';
// import 'package:calendario/presentation/bloc/agent_bloc.dart';
// import 'package:calendario/presentation/pages/agent/agent_cancel/agent_cancel_page.dart';
// import 'package:calendario/presentation/pages/agent/agent_complet/agent_complete_page.dart';
// import 'package:calendario/presentation/pages/agent/agent_invoice/agent_invoice_one_page.dart';
// import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_page.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HearRowAgent extends StatelessWidget {
//   final String date;

//   const HearRowAgent({Key? key, required this.date}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       // ignore: prefer_const_literals_to_create_immutables
//       children: [
//         const MyText(
//           text: 'Fecha: ',
//           color: Palette.blue1,
//           fontWeight: FontWeight.w700,
//           size: SizeText.text3 - 2,
//         ),
//         const SizedBox(width: 15),
//         MyText(
//           text: date,
//           size: SizeText.text3 - 2,
//           fontWeight: FontWeight.w700,
//         )
//       ],
//     );
//   }
// }

// class BuildDropDown extends StatelessWidget {
//   const BuildDropDown({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<AgentModelProvider>(context, listen: true);

//     AgendaDateModelDrop _tipoSelect = agendasDateModelDrop
//         .where((element) => element.typehorario == bloc.typeHorario)
//         .first;
//     return Container(
//       color: Palette.gray5,
//       padding: const EdgeInsets.only(right: 10),
//       child: Row(
//         children: [
//           const Expanded(flex: 1, child: Icon(Icons.date_range)),
//           Expanded(
//             flex: 9,
//             child: SizedBox(
//               width: double.infinity,
//               child: DropdownButton<AgendaDateModelDrop>(
//                 disabledHint: const Text("Disabled"),
//                 underline: Container(
//                     decoration: const BoxDecoration(
//                         border: Border(bottom: BorderSide.none))),
//                 elevation: 3,
//                 icon: const Icon(Icons.keyboard_arrow_down_outlined),
//                 isExpanded: true,
//                 dropdownColor: Palette.gray5,
//                 value: _tipoSelect,
//                 onChanged: (AgendaDateModelDrop? value) {
//                   bloc.changeType(type: value!.typehorario);
//                 },
//                 items: agendasDateModelDrop.map((AgendaDateModelDrop data) {
//                   return DropdownMenuItem(
//                     value: data,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         MyText(
//                           text: data.descripcion,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListTileAgent extends StatelessWidget {
//   final Booking obj;
//   const ListTileAgent({Key? key, required this.obj}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<AgentModelProvider>(context, listen: true);
//     final agendaBloc = Provider.of<AgendaBloc>(context, listen: false);

//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         children: [
//           Icon(
//             (obj.bookingStateId == 4) ? Icons.cancel : Icons.check_circle_sharp,
//             color: MyUtilsstatusColor(obj.bookingStateId!),
//           ),
//           const SizedBox(width: 10),
//           MyText(
//             text: obj.initialTime!,
//             fontWeight: FontWeight.w600,
//           ),
//           const SizedBox(width: 30),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 MyText(
//                   text: obj.name!,
//                   color: Palette.blue1,
//                   fontWeight: FontWeight.w600,
//                   size: SizeText.text5 + 2,
//                 ),
//                 MyText(
//                   text: obj.serviceDescription!,
//                   fontWeight: FontWeight.w400,
//                   size: SizeText.text5,
//                 ),
//               ],
//             ),
//           ),
//           InkWell(
//               onTap: () {},
//               child: const Icon(
//                 Icons.info_outline,
//                 size: 26,
//                 color: Palette.green2,
//               )),
//           if (obj.bookingStateId == 1 || obj.bookingStateId == 6)
//             InkWell(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (_) => Center(
//                       // Aligns the container to center
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.white,
//                         ),
//                         padding: const EdgeInsets.all(15),
//                         // A simplified version of dialog.
//                         width: 250.0,
//                         height: 250.0,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Column(
//                                   children: [
//                                     GestureDetector(
//                                       child: const Icon(
//                                         Icons.compare_arrows,
//                                         size: 30,
//                                         color: Palette.blue1,
//                                       ),
//                                       onTap: () async {
//                                         agendaBloc.initProgram(bookingObj: obj);

//                                         bool valida =
//                                             await bloc.validaReprogram(
//                                                 bookingID: obj.bookingId!);

//                                         Navigator.pop(context);

//                                         if (valida) {
//                                           agendaBloc.setServiceID =
//                                               obj.serviceId;
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     AgentReproPage()),
//                                           );
//                                         }
//                                       },
//                                     ),
//                                     const MyText(
//                                       size: 13,
//                                       text: 'Reprogramar Cita',
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     GestureDetector(
//                                       child: const Icon(
//                                         Icons.cancel,
//                                         size: 30,
//                                         color: Palette.statuscancelada,
//                                       ),
//                                       onTap: () {
//                                         agendaBloc.initProgram(
//                                           bookingObj: obj,
//                                         );

//                                         Navigator.pushNamed(context,
//                                             AgentCancelDetailPage.routeName);
//                                       },
//                                     ),
//                                     const MyText(
//                                       size: 13,
//                                       text: 'Cancelar Cita',
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Column(
//                                   children: [
//                                     GestureDetector(
//                                       child: const Icon(
//                                         Icons.check_sharp,
//                                         size: 30,
//                                         color: Palette.green2,
//                                       ),
//                                       onTap: () {
//                                         agendaBloc.initProgram(
//                                           bookingObj: obj,
//                                         );

//                                         Navigator.pushNamed(context,
//                                             AgentCompletePage.routeName);
//                                       },
//                                     ),
//                                     const MyText(
//                                       size: 13,
//                                       text: 'Completar Cita',
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             //
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.dashboard,
//                   size: 26,
//                   color: Palette.blue1,
//                 )),

//           if (obj.bookingStateId == 3)
//             Row(
//               children: [
//                 InkWell(
//                     onTap: () {},
//                     child: const Icon(
//                       Icons.lock_open_sharp,
//                       size: 26,
//                       color: Palette.purple,
//                     )),
//                 InkWell(
//                     onTap: () {
//                       agendaBloc.initProgram(
//                         bookingObj: obj,
//                       );

//                       Navigator.pushNamed(
//                           context, AgentInvoiceOnePage.routeName);
//                     },
//                     child: const Icon(
//                       Icons.article,
//                       size: 26,
//                       color: Palette.orange,
//                     )),
//               ],
//             ),

//           // IconSvgButtomAppbar(
//           //   svg: 'assets/svg/threepoints_vertical.svg',
//           //   colorSvg: Colors.black,
//           //   onPress: onPressIcon,
//           //   sizeSvg: 15,
//           // ),
//         ],
//       ),
//     );
//   }
// }
