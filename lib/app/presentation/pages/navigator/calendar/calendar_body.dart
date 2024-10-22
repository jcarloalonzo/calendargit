import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../config/app_config/palette.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../../../config/helpers/helpers.dart';
import '../../../../../dependency_injection.dart';
import '../../../../domain/models/booking.dart';
import '../../../blocs/general/bookings/bookings_bloc.dart';
import '../../../blocs/general/bookings/screen_model/bookings_screen_model.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_text.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key, this.state, required this.model});
  final BookingsScreenModel model;
  final GlobalKey<DayViewState>? state;

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  @override
  void initState() {
    super.initState();
    // aaa();
  }

  aaa() async {
    final bloc = getIt<BookingsBloc>();
    // bloc.state

    final bookings = widget.model.bookings.toList();

    for (Booking booking in bookings) {
      final event = CalendarEventData<Booking>(
        title: booking.serviceDescription,
        date: booking.date,
        event: booking,
        startTime: DateTime.tryParse(
            '${Helpers.formatDate(booking.date)} ${booking.initialTime}:01'),
        endTime: DateTime.tryParse(
                '${Helpers.formatDate(booking.date)} ${booking.finalTime}')
            ?.add(Duration(milliseconds: -1)),
      );
      CalendarControllerProvider.of<Booking>(context).controller.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        CalendarControllerProvider.of<Booking>(context).controller;

    return Column(
      children: [
        MyButtom(
          'add',
          onTap: () {
            aaa();
          },
        ),
        MyButtom(
          'all',
          onTap: () {
            final zz = CalendarControllerProvider.of<Booking>(context)
                .controller
                .allEvents
                .toList();
            print(zz);
          },
        ),
        MyButtom(
          'remove',
          onTap: () {
            final events = CalendarControllerProvider.of<Booking>(context)
                .controller
                .allEvents
                .toList();

            CalendarControllerProvider.of<Booking>(context)
                .controller
                .removeAll(events);
          },
        ),
        Expanded(
          child: DayView<Booking>(
            key: widget.state,
            showVerticalLine: true,
            pageTransitionCurve: Curves.slowMiddle,
            backgroundColor: Palette.backgroundColor,

            controller: controller,
            pageTransitionDuration: const Duration(milliseconds: 400),
            timeLineBuilder: (e) {
              return Container(
                padding: const EdgeInsets.only(left: 15),
                height: 100,
                width: 500,
                child: MyText(
                  Jiffy.parseFromDateTime(e).format(pattern: 'HH:mm'),
                  color: Palette.colorApp,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text5,
                ),
              );
            },

            dayTitleBuilder: (e) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                color: Palette.colorApp,
                child: Row(
                  children: [
                    MyText(
                      Jiffy.parseFromDateTime(e).format(pattern: 'd'),
                      color: Palette.white,
                      size: 70,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          Helpers.firstUpper(Jiffy.parseFromDateTime(e).EEEE),
                          color: Palette.white,
                          size: SizeText.text4 + 1,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 5),
                        MyText(
                          Helpers.firstUpper(Jiffy.parseFromDateTime(e)
                              .format(pattern: 'MMMM yyyy')),
                          color: Palette.white,
                          size: SizeText.text4 + 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            // onEventTap: (events, date) {
            //   print(events[0]);
            // },
            //     List<CalendarEventData<Booking>> events,
            //     boundry,
            //     DateTime start,
            //     DateTime end) {
            //   return Container(
            //     color: Helpers.statusColorBookingState(
            //         events[0].event!.bookingStateId),
            //     child: Center(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           // MyText(
            //           //   color: Palette.white,
            //           //   events[0].event!.serviceDescription,
            //           //   fontWeight: FontWeight.w600,
            //           //   size: SizeText.text4,
            //           // ),
            //           // const SizedBox(height: 10),
            //           // MyText(
            //           //   events[0].event!.name,
            //           //   color: Colors.white,
            //           //   size: 13,
            //           //   fontWeight: FontWeight.w800,
            //           // ),
            //           // MyText(
            //           //   '${events[0].event!.initialTime} - ${events[0].event!.finalTime}',
            //           //   color: Colors.white,
            //           //   size: 15,
            //           //   fontWeight: FontWeight.w600,
            //           // ),
            //         ],
            //       ),
            //     ),
            //   );
            // },
            showLiveTimeLineInAllDays: true,

            startHour: 09, // To set the first hour displayed (ex: 05:00)
            endHour: 20, // To set the end hour displayed
            timeLineWidth: 90,
            heightPerMinute: 1.2,
            hourIndicatorSettings: const HourIndicatorSettings(
                color: Palette.colorApp, height: 0.7, offset: 0.7),
            eventArranger:
                const SideEventArranger(), // To define how simultaneous events will be arranged.
            // onEventTap: (events, date) {
            //   //
            // },
          ),
        ),
      ],
    );
    // return DayView<Booking>(
    //   controller: controller,
    //   key: widget.state,
    //   showVerticalLine: true,
    //   pageTransitionCurve: Curves.slowMiddle,
    //   backgroundColor: Palette.backgroundColor,
    //   pageTransitionDuration: const Duration(milliseconds: 400),
    //   timeLineBuilder: (e) {
    //     return Container(
    //       padding: const EdgeInsets.only(left: 15),
    //       height: 100,
    //       width: 500,
    //       child: MyText(
    //         Jiffy.parseFromDateTime(e).format(pattern: 'HH:mm'),
    //         color: Palette.colorApp,
    //         fontWeight: FontWeight.w700,
    //         size: SizeText.text5,
    //       ),
    //     );
    //   },
    //   timeLineWidth: 90,
    //   dayTitleBuilder: (e) {
    //     return Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 25),
    //       width: double.infinity,
    //       color: Palette.colorApp,
    //       child: Row(
    //         children: [
    //           MyText(
    //             Jiffy.parseFromDateTime(e).format(pattern: 'd'),
    //             color: Palette.white,
    //             size: 70,
    //             fontWeight: FontWeight.w700,
    //           ),
    //           const SizedBox(width: 15),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               MyText(
    //                 Helpers.firstUpper(Jiffy.parseFromDateTime(e).EEEE),
    //                 color: Palette.white,
    //                 size: SizeText.text4 + 1,
    //                 fontWeight: FontWeight.w400,
    //               ),
    //               const SizedBox(height: 5),
    //               MyText(
    //                 Helpers.firstUpper(Jiffy.parseFromDateTime(e)
    //                     .format(pattern: 'MMMM yyyy')),
    //                 color: Palette.white,
    //                 size: SizeText.text4 + 1,
    //                 fontWeight: FontWeight.w400,
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );
    //   },

    //   //

    //   heightPerMinute: 1.2,
    //   hourIndicatorSettings: const HourIndicatorSettings(
    //       color: Palette.colorApp, height: 0.7, offset: 0.7),
    //   showLiveTimeLineInAllDays: true,
    //   eventArranger:
    //       const SideEventArranger(), // To define how simultaneous events will be arranged.
    //   onEventTap: (events, date) {
    //     // Navigator.push(
    //     //     context,
    //     //     MaterialPageRoute(
    //     //       builder: (context) =>
    //     //           BookingDetailPage.init(context, events[0].event!),
    //     //     ));
    //   },
    // );
  }
}
