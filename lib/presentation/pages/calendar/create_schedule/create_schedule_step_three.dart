// import 'package:calendario/core/config/Utils.dart';
// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/presentation/pages/navigator/navigation_page.dart';
// import 'package:calendario/presentation/widgets/background_page.dart';
// import 'package:calendario/presentation/widgets/my_buttom.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:flutter/material.dart';

// class CreateScheduleStepThree extends StatelessWidget {
//   static String routeName = "/createScheduleStepThree";

//   const CreateScheduleStepThree({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundPage(
//       title: 'Confirmación de reserva',
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             //
//             Card(
//               color: Colors.grey[100],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Container(
//                 padding: const EdgeInsets.all(15),
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const ItemConfirmacionColumn(
//                       title: 'Servicio',
//                       data: 'Laceado',
//                     ),
//                     const SizedBox(height: 15),
//                     const ItemConfirmacionColumn(
//                       title: 'Especialista',
//                       data: 'Eva maria',
//                     ),
//                     const SizedBox(height: 15),
//                     const ItemConfirmacionColumn(
//                       title: 'Fecha Turno',
//                       data: '10/04/2022 / 09:00:00 - 12:00:00 ',
//                     ),
//                     const SizedBox(height: 15),
//                     const ItemConfirmacionColumn(
//                       title: 'Cliente',
//                       data: 'Juan Carlos Portocarrero',
//                     ),
//                     const SizedBox(height: 15),
//                     ItemConfirmacionColumn(
//                       title: 'Costo',
//                       data: MyUtilsformatPrice(100),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 100),
//             MyButtom(
//               text: 'RESERVAR',
//               color: Palette.blue,
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   NavigationPage.routeName,
//                 );
//                 //
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemConfirmacionColumn extends StatelessWidget {
//   final String title;
//   final String? data;
//   const ItemConfirmacionColumn({
//     Key? key,
//     required this.title,
//     this.data = '',
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MyText(
//           text: title,
//           size: 15,
//           fontWeight: FontWeight.w400,
//         ),
//         const SizedBox(height: 2),
//         Row(
//           children: [
//             Expanded(
//               child: MyText(
//                 size: 13,
//                 text: data!,
//                 color: Palette.blue1,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
