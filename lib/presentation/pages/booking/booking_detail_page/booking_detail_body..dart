// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_alerts.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_dialogs.dart';
import '../../../widgets/my_icon_buttom_circle copy.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/show_loader.dart';
import '../../../widgets/textfield_general.dart';
import '../../navigator/background_navigator.dart';
import '../../reschedule_appointment/reschedule_appointment_page.dart';
import 'booking_detail_bloc.dart';

class BookingDetailBody extends StatelessWidget {
  const BookingDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<BookingDetailBloc>();
    final booking = bloc.booking;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySizedBoxHeight(),
              MyText(
                text: booking.serviceDescription ?? '',
                fontWeight: FontWeight.w700,
                color: Palette.black2,
                size: SizeText.text3,
                textAlign: TextAlign.start,
              ),
              const MySizedBoxHeight(),
              MyText(
                text: 'Código: ${booking.bookingCode}',
                fontWeight: FontWeight.w400,
                color: Palette.black2,
                size: SizeText.text4,
                textAlign: TextAlign.start,
              ),
              const MySizedBoxHeight(),
              Row(
                children: [
                  const MyText(
                    text: 'Precio:',
                  ),
                  MyText(
                    text: MyUtils.formatPrice(booking.price!),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const MyText(
                        text: 'Fecha: ',
                        fontWeight: FontWeight.w400,
                        size: SizeText.text4,
                        textAlign: TextAlign.start,
                        color: Palette.black2,
                      ),
                      MyText(
                        text: (MyUtils.formatDate(booking.date!)).toString(),
                        fontWeight: FontWeight.w400,
                        color: Palette.black2,
                        size: SizeText.text4,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const MyText(
                        text: 'Hora: ',
                        fontWeight: FontWeight.w400,
                        size: SizeText.text4,
                        color: Palette.black2,
                        textAlign: TextAlign.start,
                      ),
                      MyText(
                        text: '${booking.initialTime} - ${booking.finalTime}',
                        fontWeight: FontWeight.w400,
                        size: SizeText.text4,
                        color: Palette.black2,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              const MySizedBoxHeight(),
              const Divider(color: Palette.gray8, thickness: 1),
              Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.red,
                    maxRadius: 12,
                    backgroundColor:
                        MyUtils.statusColor(booking.bookingStateId!),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: MyText(
                      text: booking.bookingState!,
                      size: SizeText.text5,
                      color: Palette.black2,
                    ),
                  ),
                ],
              ),
              const Divider(color: Palette.gray8, thickness: 1),
              const MySizedBoxHeight(),
              MyTextFieldContainer(
                title: 'Cliente',
                isEnabled: false,
                controller: TextEditingController(text: booking.name),
              ),
              const MySizedBoxHeight(),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: Palette.green1,
                  ),
                  const SizedBox(width: 10),
                  MyText(
                    text: booking.phoneNumber ?? 'Sin información',
                    color: Palette.black2,
                  )
                ],
              ),
              const MySizedBoxHeight(kDouble: 15),
              Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    color: Palette.blue1,
                  ),
                  const SizedBox(width: 10),
                  MyText(
                    text: booking.emailAddress ?? 'Sin Información',
                    color: Palette.black2,
                  )
                ],
              ),
              const MySizedBoxHeight(kDouble: 15),
              const MyTextFieldContainer(
                title: 'Comentarios',
                minLines: 3,
                hintText: 'Comentarios adicionales',
                maxLines: 5,
              ),
              const MySizedBoxHeight(kDouble: 15),
              Row(
                children: [
                  MyIconButtomCircle(
                    icon: Icons.phone_callback_rounded,
                    colorIcon: Palette.white,
                    colorBackground: const Color(0xffE6864E),
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  MyIconButtomCircle(
                    icon: Icons.phone,
                    colorIcon: Palette.white,
                    colorBackground: const Color(0xff25d366),
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  MyIconButtomCircle(
                    colorIcon: Palette.white,
                    icon: Icons.email_outlined,
                    colorBackground: Palette.blue1,
                    onTap: () {},
                  ),
                ],
              ),
              const MySizedBoxHeight(kDouble: 20),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        if (booking.bookingStateId != 4 &&
            booking.bookingStateId != 3 &&
            booking.bookingStateId != 5) ...[
          Row(
            children: [
              Expanded(
                child: MyButtom(
                    text: 'Cancelar',
                    color: Palette.red1,
                    onTap: () async {
                      final action = await MyDialogs.yesAbortDialog(
                        context: context,
                        title: '¿Está seguro de cancelar la reserva?',
                        body: 'Cancelar reserva ${bloc.booking.bookingCode}',
                      );
                      if (!context.mounted) return;
                      if (action != DialogAction.yes) return;
                      final response = await Loader.showLoader(
                          context, bloc.anulateBooking(reason: ''));
                      if (!context.mounted) return;
                      if (!response) return;
                      final actionSuccess = await MyAlerts.sucess(
                          context: context,
                          body: 'Se cancelo la reserva de forma correcta');
                      if (actionSuccess != DialogsAlerts.yes) return;
                      Navigator.popAndPushNamed(
                          context, BackGroundNavigator.routeName);
                    }),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: MyButtom(
                    text: 'Completar',
                    color: Palette.green2,
                    onTap: () async {
                      final action = await MyDialogs.yesAbortDialog(
                        context: context,
                        title: '¿Está seguro de completar la reserva?',
                        body: 'Completar reserva ${bloc.booking.bookingCode}',
                      );
                      if (!context.mounted) return;
                      if (action != DialogAction.yes) return;
                      final response = await Loader.showLoader(
                          context, bloc.completeBooking());
                      if (!context.mounted) return;
                      if (!response) return;
                      final actionSuccess = await MyAlerts.sucess(
                          context: context,
                          body: 'Se completo la reserva de forma correcta');
                      if (actionSuccess != DialogsAlerts.yes) return;
                      Navigator.popAndPushNamed(
                          context, BackGroundNavigator.routeName);
                    }),
              ),
            ],
          ),
          const MySizedBoxHeight(),
        ],

        if (booking.bookingStateId != 4 &&
            booking.bookingStateId != 3 &&
            booking.bookingStateId != 5)
          MyButtom(
              text: 'Reprogramar',
              color: Palette.blue2,
              onTap: () async {
                final action = await MyDialogs.yesAbortDialog(
                  context: context,
                  title: '¿Está seguro de reprogramar la reserva?',
                  body: 'reprogramar reserva ${bloc.booking.bookingCode}',
                );
                if (!context.mounted) return;
                if (action != DialogAction.yes) return;

                final response = await Loader.showLoader(
                    context, bloc.validateToReprogram());
                if (!context.mounted) return;
                if (!response) return;

                //TODO FALTA
                // bloc.initProgram(bookingObj: booking);
                // bool valida = await bloc.validaReprogram(
                //     bookingID: booking.bookingId!, ctx: context);
                // if (valida) {
                //   bloc.setServiceID = booking.serviceId;
                //   Navigator.pushNamed(context, AgentReproPage.routeName);
                // }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RescheduleAppointmentPage.init(context),
                    ));
              }),
        if (booking.bookingStateId == 3)
          MyButtom(
              text: 'Facturar',
              color: Palette.blue2,
              onTap: () async {
                // return _processsInvoice(context, booking);
              }),
        const MySizedBoxHeight(),

//
      ],
    );
  }
}
