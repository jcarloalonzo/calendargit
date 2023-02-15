// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/core/config/size_text.dart';
// import 'package:calendario/presentation/pages/schedule_old/create_schedule/create_schedule_step_two.dart';
// import 'package:calendario/presentation/widgets/background_page.dart';
// import 'package:calendario/presentation/widgets/my_buttom.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:calendario/presentation/widgets/textfield_general.dart';
// import 'package:flutter/material.dart';

// class CreateScheduleStepOne extends StatelessWidget {
//   static String routeName = "/CreateScheduleStepOne";

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundPage(
//         title: 'Crear reserva de servicio',
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 children: const [
//                   MyText(
//                     text: 'Datos del Cliente',
//                     fontWeight: FontWeight.w700,
//                     size: SizeText.text3,
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const MyTextFieldContainer(
//                 title: 'Nombre Completo',
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: const [
//                   Expanded(
//                     child: MyTextFieldContainer(
//                       title: 'Correo',
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: MyTextFieldContainer(
//                       title: 'Telefono',
//                       textInputType: TextInputType.number,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: const [
//                   MyText(
//                     text: 'Datos del Servicio',
//                     fontWeight: FontWeight.w700,
//                     size: SizeText.text3,
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const MyTextFieldContainer(
//                 title: 'Servicio',
//               ),
//               const SizedBox(height: 40),
//               MyButtom(
//                 text: 'CONTINUAR',
//                 color: Palette.blue,
//                 onTap: () {
//                   Navigator.pushNamed(
//                     context,
//                     CreateScheduleStepTwo.routeName,
//                   );
//                   //
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
