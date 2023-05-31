import 'package:flutter/material.dart';

import '../../../../core/config/Utils.dart';
import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/entities/booking.dart';
import '../../../widgets/my_background_with_buttons.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_icon_buttom_circle.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';

class BookingDetailPage extends StatelessWidget {
  BookingDetailPage({Key? key}) : super(key: key);
  static String routeName = '/BookingDetailPage';

  final TextEditingController _observationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as EventDetailArguments;
    final args = ModalRoute.of(context)!.settings.arguments as Booking;
    // final bloc = Provider.of<ScheduleBloc>(context, listen: false);

    return MyBackGroundWithButtons(
      titleAppBar: 'Detalles de la reserva',
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save, color: Palette.white))
      ],
      bottomExpanded: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            if (args.bookingStateId != 4 &&
                args.bookingStateId != 3 &&
                args.bookingStateId != 5)
              Row(
                children: [
                  Expanded(
                    child: MyButtom(
                        text: 'Cancelar',
                        color: Palette.red1,
                        onTap: () async {
                          // bloc.initProgram(bookingObj: args);

                          // Provider.of<ScheduleBloc>(context, listen: false)
                          //     .initCancelFilter();

                          // final action =
                          //     await ScheduleMethods.cancelacionBookingMethod(
                          //         context: context,
                          //         title:
                          //             'Cancelar reserva ${bloc.bookingSeleccionado!.bookingCode}',
                          //         body: '¿Está seguro de cancelar la reserva?');
                          // if (action == DialogsAlerts.yes) {
                          //   return _processCancelate(context);
                          // }
                        }),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: MyButtom(
                        text: 'Completar',
                        color: Palette.green2,
                        onTap: () async {
                          // bloc.initProgram(
                          //   bookingObj: args,
                          // );
                          // return _processconfirm(context, args);
                        }),
                  ),
                ],
              ),
            if (args.bookingStateId != 4 &&
                args.bookingStateId != 3 &&
                args.bookingStateId != 5)
              MyButtom(
                  text: 'Reprogramar',
                  color: Palette.blue2,
                  onTap: () async {
                    // bloc.initProgram(bookingObj: args);
                    // bool valida = await bloc.validaReprogram(
                    //     bookingID: args.bookingId!, ctx: context);
                    // if (valida) {
                    //   bloc.setServiceID = args.serviceId;
                    //   Navigator.pushNamed(context, AgentReproPage.routeName);
                    // }
                  }),
            if (args.bookingStateId == 3)
              MyButtom(
                  text: 'Facturar',
                  color: Palette.blue2,
                  onTap: () async {
                    // return _processsInvoice(context, args);
                  }),
          ],
        ),
      ),
      child: MyCardContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySizedBoxHeight(),
            MyText(
              text: args.serviceDescription ?? '',
              fontWeight: FontWeight.w700,
              color: Palette.black2,
              size: SizeText.text3,
              textAlign: TextAlign.start,
            ),
            const MySizedBoxHeight(),
            MyText(
              text: 'Código: ${args.bookingCode}',
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
                  text: MyUtils.formatPrice(args.price!),
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
                      text: (MyUtils.formatDate(args.date!)).toString(),
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
                      text: '${args.initialTime} - ${args.finalTime}',
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
                  backgroundColor: MyUtils.statusColor(args.bookingStateId!),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: MyText(
                    text: args.bookingState!,
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
              controller: TextEditingController(text: args.name),
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
                  text: args.phoneNumber ?? 'Sin información',
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
                  text: args.emailAddress ?? 'Sin Información',
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
    );
  }

  // void _processsInvoice(BuildContext context, Booking booking) async {
  //   final bloc = Provider.of<ScheduleBloc>(context, listen: false);

  //   final myLoading = MyLoading(context);

  //   bloc.initProgram(bookingObj: booking);

  //   final action = await ScheduleMethods.toInvoiceMethod(context);

  //   if (action == DialogsAlerts.yes) {
  //     myLoading.createLoading();

  //     var response = await bloc.generateInvoiceBooking();
  //     myLoading.dismiss();

  //     if (response.statusCode == 200) {
  //       Future.delayed(Duration.zero, () async {
  //         final action = await MyAlerts.sucess(
  //             context: context,
  //             body:
  //                 'Se emitio el invoice ${response.data?.codeNumber}-${response.data?.numberId} forma correcta.');
  //         if (action == DialogsAlerts.yes) {
  //           Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
  //         }
  //       });
  //     }
  //   } else {
  //     print('no');
  //   }
  // }
  // //

  // void _processCancelate(BuildContext context) async {
  //   final bloc = Provider.of<ScheduleBloc>(context, listen: false);

  //   final myLoading = MyLoading(context);
  //   myLoading.createLoading();

  //   var response = await bloc.anularBooking(
  //       reason: bloc.tipoCancelacionSelected.descripcion);

  //   if (response.statusCode == 200) {
  //     Future.delayed(Duration.zero, () async {
  //       final action = await MyAlerts.sucess(
  //           context: context, body: 'Se cancelo la reserva de forma correcta');
  //       if (action == DialogsAlerts.yes) {
  //         Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
  //       }
  //     });
  //   }
  //   myLoading.dismiss();
  // }
  // //
  // //

  // void _processconfirm(BuildContext context, Booking booking) async {
  //   final bloc = Provider.of<ScheduleBloc>(context, listen: false);

  //   final myLoading = MyLoading(context);
  //   myLoading.createLoading();

  //   var response = await bloc.completeBooking();
  //   myLoading.dismiss();
  //   if (response.statusCode == 200) {
  //     Future.delayed(Duration.zero, () async {
  //       final action = await MyDialogs.yesAbortDialog(
  //           context: context,
  //           title: 'Reserva completada con exito',
  //           body: '¿Deseas emitir invoice?');

  //       if (action == DialogAction.yes) {
  //         _processsInvoice(context, booking);
  //       } else {
  //         Navigator.popAndPushNamed(context, BackGroundNavigator.routeName);
  //       }
  //     });
  //   }
  // }
}
