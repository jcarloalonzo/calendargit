// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../bloc/booking_bloc.dart';
// import '../../bloc/main_bloc.dart';
// import '../../widgets/confirm_alternate.dart';
// import '../../widgets/contenedor_rectangle.dart';
// import '../../widgets/my_background.dart';
// import 'booking_body.dart';

// class BookingPage extends StatelessWidget {
//   const BookingPage._();

//   static Widget init(BuildContext context, int? bookingID) {
//     final blocLogin = Provider.of<MainBloc>(context, listen: false);
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => BookingBloc()
//             ..init(
//                 businessID: blocLogin.modelBusiness!.businessId!,
//                 personID: blocLogin.login!.personId,
//                 bookingID: bookingID),
//         ),
//       ],
//       child: const BookingPage._(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<BookingBloc>(context, listen: true);

//     if (bloc.responseModel != null) {
//       if (bloc.responseModel!.statusCode != 200) {
//         Future.delayed(Duration.zero, () async {
//           confirmAlternantError(
//               context: context,
//               errormodel: bloc.responseModel!.error!,
//               statuscode: bloc.responseModel!.statusCode!);
//           bloc.responseModel = null;
//         });
//       }
//     }

//     return MyBackGround(
// // allAnchorwindow: true,
//       isDrawer: false,
//       // isAppBar: false,
//       actions: [
//         IconButton(
//           icon: const Icon(
//             Icons.share,
//             color: Colors.green,
//           ),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: const Icon(
//             Icons.cancel,
//             color: Colors.red,
//           ),
//           onPressed: () {},
//         ),
//       ],
//       titleAppBar: 'Reserva Online',
//       child: (bloc.isLoading)
//           ? const ContenedorRectangle(child: CircularProgressIndicator())
//           : const BookingBody(),
//     );
//   }
// }
