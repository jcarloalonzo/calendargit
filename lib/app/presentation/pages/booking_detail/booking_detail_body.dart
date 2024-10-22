import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_config/codes.dart';
import '../../../../config/app_config/palette.dart';
import '../../../../config/app_config/space_helpers.dart';
import '../../../../generated/translations.g.dart';
import '../../../domain/models/booking.dart';
import '../../blocs/booking_detail/booking_detail_bloc.dart';
import '../../widgets/my_buttom.dart';
import '../../widgets/popups/my_dialog.dart';
import '../../widgets/util/loader.dart';
import '../reschedule_booking/reschedule_booking_page.dart';
import 'components/booking_detail_container_data.dart';

class BookingDetailBody extends StatelessWidget {
  const BookingDetailBody({super.key, required this.booking});
  final Booking booking;

  bool showButtomCancelComplete(int stateId) {
    return stateId != StatusCode.attended &&
        stateId != StatusCode.cancelated &&
        stateId != StatusCode.invoiced;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BookingDetailContainerData(
            booking: booking,
          ),
          SpaceHelpers.verticalVeryLong,
          if (showButtomCancelComplete(booking.bookingStateId)) ...[
            Row(
              children: [
                Expanded(
                  child: MyButtom(
                    texts.label.cancel,
                    color: Palette.red1,
                    onTap: () => _onTapCancel(context),
                  ),
                ),
                SpaceHelpers.horizontalNormal,
                Expanded(
                  child: MyButtom(
                    texts.label.complete,
                    color: Palette.green2,
                    onTap: () => _onTapComplete(context),
                  ),
                ),
              ],
            ),
            SpaceHelpers.verticalNormal,
            MyButtom(
              texts.label.reschedule,
              onTap: () => _onTapReschedule(context),
            ),
            SpaceHelpers.verticalVeryLong,
          ],
        ],
      ),
    );
  }

  void _onTapCancel(BuildContext context) async {
    final bloc = context.read<BookingDetailBloc>();
    final dialogResponse = await MyDialogs.yesAbortDialog(
      context: context,
      title: texts.messages.areYouSureYouWantToCancelTheReservation,
      body: '${texts.messages.cancelReservation} ${booking.bookingCode}',
    );
    if (!context.mounted) return;
    if (dialogResponse == DialogAction.abort) return;
    final bool response =
        await Loader.showLoader(context, bloc.cancelBooking());
    if (!context.mounted) return;
    if (!response) return;
    context.pop();
    //
  }

  void _onTapComplete(BuildContext context) async {
    final bloc = context.read<BookingDetailBloc>();
    final dialogResponse = await MyDialogs.yesAbortDialog(
      context: context,
      title: texts.messages.areYouSureYouWantToCompleteTheReservation,
      body: '${texts.messages.completeReservation} ${booking.bookingCode}',
    );
    if (!context.mounted) return;
    if (dialogResponse == DialogAction.abort) return;
    final bool response =
        await Loader.showLoader(context, bloc.completeBooking());
    if (!context.mounted) return;
    if (!response) return;
    context.pop();

    //
  }

  void _onTapReschedule(BuildContext context) async {
    final bloc = context.read<BookingDetailBloc>();
    final dialogResponse = await MyDialogs.yesAbortDialog(
      context: context,
      title: texts.messages.areYouSureYouWantToRescheduleTheReservation,
      body: '${texts.messages.rescheduleReservation} ${booking.bookingCode}',
    );
    if (!context.mounted) return;
    if (dialogResponse == DialogAction.abort) return;
    final bool response =
        await Loader.showLoader(context, bloc.validateCanReschedule());
    if (!context.mounted) return;
    if (!response) return;
    context.push(RescheduleBookingPage.route, extra: booking);

    //
  }
}
