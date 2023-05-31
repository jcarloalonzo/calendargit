// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../core/config/Utils.dart';
// import '../../../../core/config/palette.dart';
// import '../../../../core/config/size_text.dart';
// import '../../../bloc/agenda_bloc.dart';
// import '../../../bloc/schedule_bloc.dart';
// import '../../../widgets/confirm_alternate.dart';
// import '../../../widgets/confirm_at.dart';
// import '../../../widgets/my_background_with_buttons.dart';
// import '../../../widgets/my_buttom.dart';
// import '../../../widgets/my_loading_super.dart';
// import '../../../widgets/my_text.dart';
// import '../../../widgets/textfield_general.dart';
// import '../../navigator/background_navigator.dart';

// class AgentInvoiceTwoPage extends StatefulWidget {
//   const AgentInvoiceTwoPage({Key? key}) : super(key: key);
//   static String routeName = '/agentInvoiceTwoPage';

//   @override
//   State<AgentInvoiceTwoPage> createState() => _AgentInvoiceTwoPageState();
// }

// class _AgentInvoiceTwoPageState extends State<AgentInvoiceTwoPage> {
//   final TextEditingController _comentariosController = TextEditingController();
//   final TextEditingController _precioFinalController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       final agendaBloc = Provider.of<AgendaBloc>(context, listen: false);
//       _precioFinalController.text =
//           (agendaBloc.bookingSeleccionado!.price).toString();
//       //

//       //
//       //
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<ScheduleBloc>(context, listen: true);

//     return MyBackGroundWithButtons(
//       bottomExpanded: Container(
//         margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//         child: MyButtom(
//             text: 'GENERAR',
//             color: Palette.blue,
//             onTap: () {
// //
// //
// //
// //
// //
// //
// //
//             }),
//       ),
//       titleAppBar: 'EMITIR INVOICE PASO 2',
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: const [
//                 MyText(
//                   text: 'Pago anticipado',
//                   fontWeight: FontWeight.w700,
//                   size: SizeText.text3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Pagado',
//                     isEnabled: false,
//                     controller: TextEditingController(
//                         text: bloc.bookingSeleccionado?.bookingCode ?? ''),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Pendiente de pago',
//                     isEnabled: false,
//                     controller: TextEditingController(
//                         text: bloc.bookingSeleccionado?.bookingCode ?? ''),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: const [
//                 MyText(
//                   text: 'Tipo de Pago',
//                   fontWeight: FontWeight.w700,
//                   size: SizeText.text3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Checkbox(value: true, onChanged: (value) {}),
//                       const MyText(
//                         text: 'CASH',
//                         size: SizeText.text4 - 1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 //
//                 // Row(
//                 //   children: [
//                 //     Radio(value: 2, groupValue: 1, onChanged: (value) {}),
//                 //     MyText(
//                 //       text: 'Tarjeta Credito',
//                 //       size: SizeText.text4 - 1,
//                 //     ),
//                 //   ],
//                 // ),

//                 //
//                 //
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Checkbox(value: true, onChanged: (value) {}),
//                       const MyText(
//                         text: 'ZELLET',
//                         size: SizeText.text4 - 1,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             //
//             //
//             //
//             //
//             //

//             const SizedBox(height: 5),
//             Row(
//               children: [
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Pago',
//                     controller: TextEditingController(
//                         text: MyUtils.formatPrice(
//                                 bloc.bookingSeleccionado!.price!)
//                             .toString()),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Pago final',
//                     isEnabled: false,
//                     prefix: const MyText(
//                       text: '\$',
//                       color: Palette.blue,
//                     ),
//                     controller: _precioFinalController,
//                     textInputType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),

//             Row(
//               children: [
//                 Checkbox(value: true, onChanged: (value) {}),
//                 const MyText(
//                   text: 'Tarjeta de crédito',
//                   size: SizeText.text4 - 1,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),

//             Row(
//               children: [
//                 // ignore: prefer_const_constructors
//                 Expanded(
//                   flex: 2,
//                   // ignore: prefer_const_constructors
//                   child: MyTextFieldContainer(
//                     title: 'Nro. Tarjeta',
//                     hintText: '4444-4444-4444-4444',
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: MyTextFieldContainer(
//                     title: 'Pago',
//                     isEnabled: false,
//                     prefix: const MyText(
//                       text: '\$',
//                       color: Palette.blue,
//                     ),
//                     controller: _precioFinalController,
//                     textInputType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: const [
//                 MyText(
//                   text: 'Saldo',
//                   fontWeight: FontWeight.w700,
//                   size: SizeText.text3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 150,
//                   child: MyTextFieldContainer(
//                     title: 'Vuelto',
//                     isEnabled: false,
//                     prefix: const MyText(
//                       text: '\$',
//                       color: Palette.blue,
//                     ),
//                     controller: _precioFinalController,
//                     textInputType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const MyText(
//                         text: 'Sub Total',
//                         size: SizeText.text4,
//                       ),
//                       const SizedBox(height: 4),
//                       const MyText(
//                         text: 'Tax',
//                         size: SizeText.text4,
//                       ),
//                       const SizedBox(height: 4),
//                       const MyText(
//                         text: 'Total',
//                         size: SizeText.text4,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MyText(
//                       text: MyUtils.formatPrice(80),
//                       size: SizeText.text4,
//                     ),
//                     const SizedBox(height: 4),
//                     MyText(
//                       text: MyUtils.formatPrice(0),
//                       size: SizeText.text4,
//                     ),
//                     const SizedBox(height: 4),
//                     MyText(
//                       text: MyUtils.formatPrice(80),
//                       size: SizeText.text4,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),

//             const SizedBox(height: 65),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openmodal(BuildContext context, String tittle) {
//     Future.delayed(Duration.zero, () async {
//       ConfirmAlternant(context: context, action: () => _processconfirm(context))
//           .confirmDialogBack(tittle, '¿Está seguro de completar la reserva?',
//               '   CANCELAR   ', '    SI   ', 120.00);
//     });
//   }

//   void _processconfirm(BuildContext context) async {
//     final bloc = Provider.of<ScheduleBloc>(context, listen: false);

//     final myLoading = MyLoading(context);
//     myLoading.createLoading();

//     var response = await bloc.completeBooking();
//     // comentario: _comentariosController.text,
//     // priceFinal: _precioFinalController.text);

//     if (response.statusCode == 200) {
//       Future.delayed(Duration.zero, () {
//         ConfirmAt(
//                 context: context,
//                 action: () {
//                   Navigator.popAndPushNamed(
//                       context, BackGroundNavigator.routeName);
//                 },
//                 content: const ContentSucess(
//                   text: 'Gracias por confirmar la reserva.',
//                 ))
//             .confirmDialogBack('Registro Exitoso', 'Aceptar', 180,
//                 refresh: true);
//       });
//     }
//     myLoading.dismiss();
//   }
// }

