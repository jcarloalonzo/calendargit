import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/config/Utils.dart';
import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../../data/models/entities/booking.dart';
import '../../widgets/my_dialogs.dart';
import '../../widgets/my_text.dart';
import '../agent/schedule_reservation_free/schedule_reservationfree_page.dart';
import '../booking/booking_detail_page/booking_detail_page.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({Key? key, this.state}) : super(key: key);
  final GlobalKey<DayViewState>? state;

  @override
  Widget build(BuildContext context) {
    final controller =
        CalendarControllerProvider.of<Booking>(context).controller;
    Future.delayed(Duration.zero, () async {
      // data(context);
    });

    return Expanded(
      child: DayView<Booking>(
        controller: controller,
        onDateLongPress: (e) async {
          DialogAction? action = await MyDialogs.yesAbortDialog(
              height: 54,
              context: context,
              title: 'Reservar reserva',
              body:
                  '¿Desea realizar reserva a la hora: ${MyUtils.firstUpper(Jiffy(e).format("HH:mm"))}?');
          if (action == DialogAction.yes) {
            Navigator.pushNamed(context, ScheduleReservationFreePage.routeName,
                arguments: e.toString());

            // if (a != null)
            // CalendarControllerProvider.of<Booking>(context).controller.add(a);
          }
        },
        // onPageChange: (e, x) {
        //   print(e);
        //   print(x);
        // },
        key: state,
        showVerticalLine: true,
        pageTransitionCurve: Curves.slowMiddle,
        backgroundColor: Palette.backgroundColor,
        liveTimeIndicatorSettings: const HourIndicatorSettings(
          color: Colors.red,
          offset: 0,
          height: 0,
        ),
        // timeLineWidth: 500,
        pageTransitionDuration: const Duration(milliseconds: 400),
        timeLineBuilder: (e) {
          return Container(
            padding: const EdgeInsets.only(left: 15),
            height: 100,
            width: 500,
            child: MyText(
              text: Jiffy(e).format('HH:mm'),
              color: Palette.colorApp,
              fontWeight: FontWeight.w700,
              size: SizeText.text5,
            ),
          );
        },
        timeLineWidth: 90,
        dayTitleBuilder: (e) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            color: Palette.colorApp,
            child: Row(
              children: [
                MyText(
                  text: Jiffy(e).format('d'),
                  color: Palette.white,
                  size: 70,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: MyUtils.firstUpper(Jiffy(e).EEEE),
                      color: Palette.white,
                      size: SizeText.text4 + 1,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      text: MyUtils.firstUpper(Jiffy(e).format('MMMM yyyy')),
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
        heightPerMinute: 1.2,
        hourIndicatorSettings: const HourIndicatorSettings(
            color: Palette.colorApp, height: 0.7, offset: 0.7),
        eventTileBuilder: (date, events, boundry, start, end) {
          return Container(
            // color: Colors.green.withOpacity(0.4),
            color: MyUtils.statusColor(events[0].event!.bookingStateId!),
            // color: Palette.white,
            // height: 100,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    color: Palette.white,
                    text: events[0].event!.serviceDescription!,
                    fontWeight: FontWeight.w600,
                    size: SizeText.text4,
                  ),
                  const SizedBox(height: 10),
                  MyText(
                    color: Colors.white,
                    text: events[0].event!.name!,
                    size: 13,
                    fontWeight: FontWeight.w800,
                  ),
                  MyText(
                    color: Colors.white,
                    text:
                        '${events[0].event!.initialTime} - ${events[0].event!.finalTime}',
                    size: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        },
        showLiveTimeLineInAllDays: true,
        eventArranger:
            const SideEventArranger(), // To define how simultaneous events will be arranged.
        onEventTap: (events, date) {
          Navigator.pushNamed(
            context,
            BookingDetailPage.routeName,
            arguments: events[0].event!,
          );

          // CalendarControllerProvider.of<Booking>(context)

          // .controller.remove(events);

          // Navigator.pushNamed(context, EventDetail.routeName);
        },
        // onDateLongPress: (date) => print(date),
      ),
    );
  }
}
