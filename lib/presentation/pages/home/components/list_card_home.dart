// import 'package:flutter/material.dart';

// import '../../../../core/config/palette.dart';
// import '../../../../core/config/size_text.dart';
// import '../../../widgets/my_text.dart';
// import '../../../widgets/mysizedbox.dart';

// class ListCardHome extends StatelessWidget {
//   const ListCardHome({
//     Key? key,
//     required this.title,
//     required this.subTitle,
//     required this.icono,
//     this.colorIcono = Colors.black,
//     this.onTap,
//   }) : super(key: key);
//   final String title;
//   final String subTitle;
//   final IconData icono;

//   final Color colorIcono;
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         child: Row(
//           children: [
//             Card(
//               elevation: 1,
//               shape: RoundedRectangleBorder(
//                 side: const BorderSide(color: Colors.white70, width: 1),
//                 borderRadius: BorderRadius.circular(08),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Icon(
//                   icono,
//                   color: colorIcono,
//                   size: 40,
//                 ),
//               ),
//             ),
//             const MySizedBoxWidth(),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MyText(
//                     text: title,
//                     color: Palette.blue3,
//                     size: SizeText.text4,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   const SizedBox(height: 2),
//                   MyText(
//                     text: subTitle,
//                     maxLines: 2,
//                     size: SizeText.text5,
//                     color: Palette.gray6,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
