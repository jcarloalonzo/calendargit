// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../core/config/Utils.dart';
// import '../../../../core/config/palette.dart';
// import '../../../../core/config/size_text.dart';
// import '../../../bloc/schedule_bloc.dart';
// import '../../../widgets/confirm_alternate.dart';
// import '../../../widgets/my_alerts.dart';
// import '../../../widgets/my_background_with_buttons.dart';
// import '../../../widgets/my_buttom.dart';
// import '../../../widgets/my_dialogs.dart';
// import '../../../widgets/my_loading_super.dart';
// import '../../../widgets/my_text.dart';
// import '../../../widgets/textfield_general.dart';
// import '../../navigator/background_navigator.dart';

// class AgentCancelDetailPage extends StatelessWidget {
//   AgentCancelDetailPage({Key? key}) : super(key: key);
//   static String routeName = '/AgentCancelDetailPage';

//   final TextEditingController _motivoController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<ScheduleBloc>(context, listen: true);

//     if (bloc.errorRepro != null) {
//       if (bloc.errorRepro!.statusCode != 200) {
//         Future.delayed(Duration.zero, () async {
//           confirmAlternantError(
//               context: context,
//               errormodel: bloc.errorRepro!.error!,
//               statuscode: bloc.errorRepro!.statusCode!);
//           bloc.errorRepro = null;
//         });
//       }
//     }

//     return MyBackGroundWithButtons(
//       bottomExpanded: Container(
//         margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//         child: MyButtom(
//           text: 'ANULAR CITA',
//           color: Palette.statuscancelada,
//           onTap: () async {
//             // Navigator.pushNamed(context, AgentCancelDetailPage.routeName);
//             final action = await MyDialogs.yesAbortDialog(
//                 context: context,
//                 title: 'Anular Reserva',
//                 body:
//                     'Anular reserva ${bloc.bookingSeleccionado!.bookingCode}');

//             if (action == DialogAction.yes) {
//               // print('yes');
//               return _processconfirm(context);
//             }
//           },
//         ),
//       ),
//       titleAppBar: 'Anular Cita',
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: const [
//                 MyText(
//                   text: 'Datos de la reserva',
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
//                     title: 'Codigo reserva',
//                     isEnabled: false,
//                     controller: TextEditingController(
//                         text: bloc.bookingSeleccionado?.bookingCode ?? ''),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Fecha',
//                     isEnabled: false,
//                     controller: TextEditingController(
//                         text: (MyUtils.formatDate(
//                                 bloc.bookingSeleccionado!.date!))
//                             .toString()),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             MyTextFieldContainer(
//               title: 'Servicio',
//               isEnabled: false,
//               controller: TextEditingController(
//                   text: bloc.bookingSeleccionado?.serviceDescription ?? ''),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Inicio - Fin ',
//                     isEnabled: false,
//                     controller: TextEditingController(
//                         text: bloc.bookingSeleccionado?.bookingCode ?? ''),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: MyTextFieldContainer(
//                     title: 'Precio',
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
//                   text: 'Datos del cliente',
//                   fontWeight: FontWeight.w700,
//                   size: SizeText.text3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             MyTextFieldContainer(
//               title: 'Cliente',
//               isEnabled: false,
//               controller: TextEditingController(
//                   text: bloc.bookingSeleccionado?.name ?? ''),
//             ),
//             const SizedBox(height: 14),
//             MyTextFieldContainer(
//               title: 'Telefono',
//               isEnabled: false,
//               controller: TextEditingController(
//                   text: bloc.bookingSeleccionado?.phoneNumber ?? ''),
//             ),
//             const SizedBox(height: 14),
//             MyTextFieldContainer(
//               title: 'Email',
//               isEnabled: false,
//               controller: TextEditingController(
//                   text: bloc.bookingSeleccionado?.emailAddress ?? ''),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: const [
//                 MyText(
//                   text: 'Motivo de cancelación',
//                   fontWeight: FontWeight.w700,
//                   size: SizeText.text3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             MyTextFieldContainer(
//               title: 'Motivo',
//               controller: _motivoController,
//             ),
//             const SizedBox(height: 14),
//             const SizedBox(height: 65),
//           ],
//         ),
//       ),
//     );
//   }

//   void _processconfirm(BuildContext context) async {
//     final bloc = Provider.of<ScheduleBloc>(context, listen: false);

//     final myLoading = MyLoading(context);
//     myLoading.createLoading();

//     var response = await bloc.anularBooking(reason: _motivoController.text);

//     if (response.statusCode == 200) {
//       Future.delayed(Duration.zero, () async {
//         final action = await MyAlerts.sucess(context: context);
//         if (action == DialogsAlerts.yes) {
//           Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
//         }
//       });
//     }
//     myLoading.dismiss();
//   }
// }
