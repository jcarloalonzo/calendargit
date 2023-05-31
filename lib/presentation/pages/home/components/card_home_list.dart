// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:provider/provider.dart';

// import '../../../../core/config/palette.dart';
// import '../../../../core/config/size_text.dart';
// import '../../../../data/models/entities/home_model.dart';
// import '../../../widgets/my_card_container.dart';
// import '../../../widgets/my_text.dart';
// import '../../../widgets/mysizedbox.dart';
// import '../home_bloc.dart';

// class CardHomeList extends StatelessWidget {
//   const CardHomeList({
//     Key? key,
//     this.onTap,
//   }) : super(key: key);
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final bookings = Provider.of<HomeBloc>(context, listen: true).bookings;

//     return MyCardContainer(
//       padding: false,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Palette.colorApp,
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(10),
//                 topLeft: Radius.circular(10),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade300,
//                   offset: const Offset(0.0, 0.8),
//                   blurRadius: 2.0,
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const MyText(
//                     text: 'Tenemos para hoy',
//                     fontWeight: FontWeight.w500,
//                     color: Palette.white,
//                   ),
//                   MyText(
//                     text: Jiffy().format('d MMMM yyyy'),
//                     fontWeight: FontWeight.w500,
//                     color: Palette.white,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           //

//           (bookings.isNotEmpty)
//               ? _ContainerDataHoy(onTap: onTap)
//               : const _ContainerNoData()
//         ],
//       ),
//     );
//   }
// }

// class _ContainerNoData extends StatelessWidget {
//   const _ContainerNoData({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//         padding: EdgeInsets.all(12),
//         child: Text(
//           'En estos momentos no presentas reservas pendientes, puedes realizar una reserva presionando el botón "Realizar una reserva"',
//           textAlign: TextAlign.justify,
//           overflow: TextOverflow.ellipsis,
//           maxLines: 7,
//           softWrap: true,
//           style: TextStyle(
//             height: 1.1,
//             fontFamily: 'Roboto',
//             fontSize: SizeText.text5 - 1,
//             color: Palette.black,
//             fontWeight: FontWeight.w400,
//           ),
//         ));
//   }
// }

// class _ContainerDataHoy extends StatelessWidget {
//   const _ContainerDataHoy({
//     Key? key,
//     required this.onTap,
//   }) : super(key: key);

//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<HomeBloc>(context, listen: true).bookings;

//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           ListView.separated(
//             separatorBuilder: (context, index) {
//               if (index <= 2) {
//                 return const SizedBox(height: 7);
//               } else {
//                 return const SizedBox();
//               }
//             },
//             itemCount: bloc.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               if (index <= 2) {
//                 return _ItemListCardHome(
//                   obj: bloc[index],
//                 );
//               } else {
//                 return const SizedBox();
//               }
//             },
//           ),
//           if (bloc.length > 3)
//             GestureDetector(
//               onTap: onTap,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: const [
//                   MyText(
//                     text: 'Mostrar más',
//                     color: Palette.blue4,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   CircleAvatar(
//                     radius: 16,
//                     backgroundColor: Palette.blue5,
//                     child: Icon(Icons.arrow_forward_ios_sharp, size: 17),
//                   )
//                 ],
//               ),
//             ),
//           const MySizedBoxHeight(),
//         ],
//       ),
//     );
//   }
// }

// class _ItemListCardHome extends StatelessWidget {
//   const _ItemListCardHome({
//     Key? key,
//     required this.obj,
//   }) : super(key: key);
//   final BookingHome obj;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: MyText(
//             text: obj.initialTime,
//             color: Palette.blue4,
//           ),
//         ),
//         Expanded(
//           flex: 4,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MyText(
//                 text: obj.serviceDescription ?? '',
//                 maxLines: 2,
//                 color: Palette.blue4,
//               ),
//               MyText(
//                 text: obj.name ?? '',
//                 maxLines: 2,
//                 color: Palette.blue4,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
