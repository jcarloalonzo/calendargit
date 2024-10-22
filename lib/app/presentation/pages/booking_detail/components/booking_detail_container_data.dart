import 'package:flutter/material.dart';

import '../../../../../config/app_config/palette.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../config/helpers/helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../domain/models/booking.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';

class BookingDetailContainerData extends StatelessWidget {
  const BookingDetailContainerData({
    super.key,
    required this.booking,
  });
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return MyCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Helpers.statusColorBookingState(
                        booking.bookingStateId)),
              ),
              SpaceHelpers.horizontalNormal,
              MyText(
                booking.bookingState,
                color: Helpers.statusColorBookingState(booking.bookingStateId),
                size: SizeText.text4,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          SpaceHelpers.verticalNormal,
          MyText(
            booking.serviceDescription,
            fontWeight: FontWeight.w700,
            color: Palette.colorApp,
            size: SizeText.text2,
            textAlign: TextAlign.start,
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: [
              MyText(
                '${texts.label.code}: ',
                fontWeight: FontWeight.w700,
                color: Palette.colorApp,
                size: SizeText.text4,
                textAlign: TextAlign.start,
              ),
              MyText(
                booking.bookingCode,
                fontWeight: FontWeight.w400,
                color: Palette.black,
                size: SizeText.text4,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SpaceHelpers.verticalVerySmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    '${texts.label.date}:',
                    fontWeight: FontWeight.w700,
                    color: Palette.colorApp,
                    size: SizeText.text4,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Palette.primaryColor,
                      ),
                      SpaceHelpers.horizontalNormal,
                      MyText(
                        Helpers.formatDate(booking.date),
                        fontWeight: FontWeight.w400,
                        color: Palette.black,
                        size: SizeText.text4,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    '${texts.label.Time}:',
                    fontWeight: FontWeight.w700,
                    color: Palette.colorApp,
                    size: SizeText.text4,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Palette.primaryColor,
                      ),
                      SpaceHelpers.horizontalNormal,
                      MyText(
                        '${booking.initialTime} - ${booking.finalTime}',
                        fontWeight: FontWeight.w400,
                        color: Palette.black,
                        size: SizeText.text4,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SpaceHelpers.verticalVerySmall,
          MyText(
            texts.label.price,
            fontWeight: FontWeight.w700,
            color: Palette.colorApp,
            size: SizeText.text4,
            textAlign: TextAlign.start,
          ),
          MyText(
            Helpers.formatPriceDollar(booking.price),
            fontWeight: FontWeight.w800,
            color: Palette.colorApp,
            size: SizeText.text2,
            textAlign: TextAlign.start,
          ),
          SpaceHelpers.verticalNormal,
          Divider(),
          SpaceHelpers.verticalNormal,
          MyTextField(
            title: texts.label.Client,
            controller: TextEditingController(
              text: booking.name.toUpperCase(),
            ),
            isEnabled: false,
          ),
          SpaceHelpers.verticalNormal,
          Row(
            children: <Widget>[
              Icon(
                Icons.phone_android,
                color: Palette.green1,
              ),
              SpaceHelpers.horizontalSmall,
              MyText(
                booking.phoneNumber,
                fontWeight: FontWeight.w400,
                color: Palette.black,
                size: SizeText.text4,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SpaceHelpers.verticalVerySmall,
          Row(
            children: <Widget>[
              Icon(
                Icons.email_outlined,
                color: Palette.colorApp,
              ),
              SpaceHelpers.horizontalSmall,
              MyText(
                booking.emailAddress ?? texts.label.noInformation,
                fontWeight: FontWeight.w400,
                color: Palette.black,
                size: SizeText.text4,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SpaceHelpers.verticalVerySmall,
        ],
      ),
    );
  }
}
