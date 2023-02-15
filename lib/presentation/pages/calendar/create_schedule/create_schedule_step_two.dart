// import 'package:calendar_agenda/calendar_agenda.dart';
// import 'package:calendario/core/config/palette.dart';
// import 'package:calendario/core/config/size_text.dart';
// import 'package:calendario/presentation/pages/schedule_old/create_schedule/create_schedule_step_three.dart';
// import 'package:calendario/presentation/widgets/background_page.dart';
// import 'package:calendario/presentation/widgets/my_buttom.dart';
// import 'package:calendario/presentation/widgets/my_text.dart';
// import 'package:flutter/material.dart';

// class CreateScheduleStepTwo extends StatelessWidget {
//   static String routeName = "/createScheduleStepTwo";
//   final CalendarAgendaController _calendarAgendaControllerNotAppBar =
//       CalendarAgendaController();
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
//                     text: 'Seleccionar Fecha y Hora',
//                     fontWeight: FontWeight.w700,
//                     size: SizeText.text3,
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//               Container(
//                 color: Colors.transparent,
//                 // color: Colors.red,
//                 height: 100,
//                 child: CalendarAgenda(
//                   fullCalendar: false,
//                   backgroundColor: Colors.transparent,
//                   controller: _calendarAgendaControllerNotAppBar,
//                   locale: 'es',
//                   weekDay: WeekDay.long,
//                   fullCalendarScroll: FullCalendarScroll.vertical,
//                   fullCalendarDay: WeekDay.short,
//                   selectedDateColor: Colors.black,
//                   // colorSelect: Colors.green,
//                   // calendarEventSelectedColor: Colors.blueAccent,

//                   dateColor: Colors.black,
//                   //  calendarEventColor: Colors.blue,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add( const Duration(days: 20)),
//                   calendarBackground: Colors.black,
//                   calendarEventColor: Colors.black,
//                   calendarEventSelectedColor: Colors.white,
//                   appbar: false,
//                   // onDateSelected: () {},
//                   onDateSelected: (date) async {
//                     // await bloc.getProgramTurn(MyUtilsformatDate(date));

//                     //MAPEAMOS DATE
//                     // blocBooking.registerBookingRequest?.date = date;

//                     // ProgramGetTurnRequest req = ProgramGetTurnRequest(
//                     //   personID: blocService.specialistSelected!.personId,
//                     //   dateProgram: MyUtilsformatDate(date),
//                     //   serviceID: blocService.serviceDetail!.serviceId,
//                     // );
//                     // //  COLOCAR AQUI GET TURN MODEL
//                     // await blocService.programGetTurn(req);
//                   },
//                 ),
//               ),
//               const SizedBox(height: 15),
//               GridView.builder(
//                 physics: const ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: 4,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   // mainAxisSpacing: 15,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 3,
//                 ),
//                 itemBuilder: (context, index) {
//                   return const _ProgramTurnContainer();
//                 },
//               ),
//               const SizedBox(height: 180),
//               MyButtom(
//                 text: 'CONTINUAR',
//                 color: Palette.blue,
//                 onTap: () {
//                   Navigator.pushNamed(
//                     context,
//                     CreateScheduleStepThree.routeName,
//                   );
//                   //
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }

// //  TEMPORAL SOLO POR MAQUETA

// class _ProgramTurnContainer extends StatelessWidget {
//   const _ProgramTurnContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//         color: Palette.green3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child:  const Center(
//           child: MyText(
//             text: '07:00 - 09:00',
//             size: SizeText.text4 - 1,
//           ),
//         ),
//       ),
//     );
//   }
// }
