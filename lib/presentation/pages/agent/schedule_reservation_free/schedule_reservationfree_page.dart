import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/booking.dart';
import '../../../../data/models/responses/to_register_schedule_free_response.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/confirm_alternate.dart';
import '../../../widgets/my_alerts.dart';
import '../../../widgets/my_background_with_buttons.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import 'schedule_reservation_bloc.dart';
import 'schedule_reservationfree_body.dart';

class ScheduleReservationFreePage extends StatelessWidget {
  const ScheduleReservationFreePage._();
  static String routeName = '/ScheduleReservationFreePage';

  static Widget init(BuildContext context) {
    final blocLogin = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              ScheduleReservationBloc()..initPage(login: blocLogin.model),
        ),
      ],
      child: const ScheduleReservationFreePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleReservationBloc>(context, listen: true);

    final args = ModalRoute.of(context)?.settings.arguments as String?;

    if (bloc.error != null) {
      if (bloc.error!.statusCode != 200) {
        Future.delayed(Duration.zero, () async {
          confirmAlternantError(
              context: context,
              errormodel: bloc.error!.error!,
              statuscode: bloc.error!.statusCode!);
          bloc.error = null;
        });
      }
    }
    return MyBackGroundWithButtons(
      backPageEnable: !bloc.isLoadingPage,
      isLoading: bloc.isLoadingPage,
      titleAppBar: 'Nueva reserva',
      bottomExpanded: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: MyButtom(
          text: 'RESERVAR',
          color: Palette.green1,
          onTap: (bloc.clientSelected != null && bloc.serviceSelected != null)
              ? () async {
                  return _processReserve(context, args!);
                }
              : null,
        ),
      ),
      child: ScheduleReservationFreeBody(date: args),
    );
  }

  void _processReserve(BuildContext context, String date) async {
    final bloc = Provider.of<ScheduleReservationBloc>(context, listen: false);

    final myLoading = MyLoading(context: context);
    myLoading.createLoading();

    var response = await bloc.registerScheduleFree(date: date);
    myLoading.dismiss();

    if (response.statusCode == 200) {
      Future.delayed(Duration.zero, () async {
//
//
//

//

//
//
//
//

        await getEvent(context, response.data!, date);
        final action = await MyAlerts.sucess(
            context: context,
            body:
                'Se genero la reserva con codigo: ${response.data?.bookingCode}');
        // if (action == DialogsAlerts.yes) {
        //   Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
        // }
        // final action = await MyDialogs.yesAbortDialog(
        //     context: context,
        //     title: 'Emitir Invoice',
        //     body: '¿Deseas emitir invoice?');

        if (action == DialogsAlerts.yes) {
          // bloc.initProgram(bookingObj: booking);

          // await ScheduleMethods.toInvoiceMethod(context);
          // _processsInvoice(context, booking);
          // Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
          Navigator.pop(context);
        } else {}
      });
    }
  }

  Future getEvent(BuildContext context, ToRegisterScheduleFreeResponse response,
      String date) async {
    final bloc = Provider.of<ScheduleReservationBloc>(context, listen: false);
    String b =
        '${MyUtils.formatDate(DateTime.parse(date))} ${bloc.getHourFinal(date)}';

    final event = CalendarEventData<Booking>(
      date: DateTime.parse(date),
      startTime: DateTime.parse(date),
      endTime: DateTime.parse(b),
      title: bloc.serviceSelected!.description!,
      event: Booking(
        bookingId: response.bookingId,
        bookingCode: response.bookingCode,
        serviceId: bloc.serviceSelected!.serviceId!,
        serviceDescription: bloc.serviceSelected!.description!,
        date: DateTime.parse(date),
        initialTime: Jiffy(date).format('HH:mm'),
        finalTime: bloc.getHourFinal(date),
        bookingState: 'POR COMFIRMAR',
        bookingStateId: 1,
        documentTypeId: bloc.clientSelected!.documentTypeId.toString(),
        identification: bloc.clientSelected!.identification!,
        name: bloc.clientSelected!.name,
        phoneNumber: bloc.clientSelected?.phoneNumber,
        emailAddress: bloc.clientSelected?.emailAddress,
        userCodeUi: bloc.clientSelected?.userCodeUi,
        price: bloc.priceService,
      ),
    );
    CalendarControllerProvider.of<Booking>(context).controller.add(event);
    // return event;
  }
}
