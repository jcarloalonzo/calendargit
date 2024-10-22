import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../../../config/app_config/size_text.dart';
import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/models/booking.dart';
import '../../../../../domain/models/user.dart';
import '../../../../blocs/general/session/session_bloc.dart';
import '../../../../widgets/my_card_container_border_indicator.dart';
import '../../../../widgets/my_text.dart';
import '../../../booking_detail/booking_detail_page.dart';

class HomeBookingItemCard extends StatelessWidget {
  const HomeBookingItemCard({
    super.key,
    required this.booking,
  });
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  booking.initialTime,
                  fontWeight: FontWeight.w700,
                  size: SizeText.text3,
                  color: Palette.black1,
                ),
                const SizedBox(height: 8),
                MyText(
                  '  ${booking.finalTime}',
                  fontWeight: FontWeight.w700,
                  color: Palette.gray7,
                  size: SizeText.text4,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Palette.black,
            thickness: 1.5,
            width: 5,
          ),
          _BookingDetailContainer(booking: booking)
        ],
      ),
    );
  }
}

class _BookingDetailContainer extends StatelessWidget {
  const _BookingDetailContainer({
    required this.booking,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<SessionBloc>().state.user;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTapBooking(context),
        child: MyCardContainerBorderIndicator(
          colorIndicator:
              Helpers.statusColorBookingState(booking.bookingStateId),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        MyText(
                          booking.bookingState,
                          color: Helpers.statusColorBookingState(
                              booking.bookingStateId),
                          fontWeight: FontWeight.w800,
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    MyText(
                      booking.serviceDescription,
                      maxLines: 5,
                      size: SizeText.text3 - 1,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 7),
                    MyText(
                      booking.name,
                      size: SizeText.text5,
                      maxLines: 3,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 7),
                    MyText(
                      '${texts.label.specialist}: ${user?.name.toUpperCase() ?? ''}',
                      size: SizeText.text5,
                      color: Palette.blue1,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 7),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTapBooking(BuildContext context) {
    context.push(BookingDetailPage.route, extra: booking);
  }
}
