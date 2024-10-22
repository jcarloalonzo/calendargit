import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../config/app_config/size_text.dart';
import '../../../../config/app_config/space_helpers.dart';
import '../../../../config/helpers/helpers.dart';
import '../../../../generated/translations.g.dart';
import '../../blocs/reschedule_confirmation/reschedule_confirmation_bloc.dart';
import '../../blocs/reschedule_confirmation/screen_model/reschedule_confirmation_screen_model.dart';
import '../../widgets/my_buttom.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_data.dart';
import '../../widgets/my_text_label.dart';
import '../../widgets/my_text_subtitle.dart';
import '../../widgets/util/loader.dart';
import '../navigator/navigator_page.dart';

class RescheduleConfirmationBody extends StatelessWidget {
  const RescheduleConfirmationBody({super.key, required this.model});
  final RescheduleConfirmationScreenModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText(
            texts.label.reschedule,
            fontWeight: FontWeight.w700,
            color: Palette.colorApp,
            size: SizeText.text1,
            textAlign: TextAlign.start,
          ),
          SpaceHelpers.verticalNormal,
          MyCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MyTextSubtitle(texts.label.reservationData),
                //
                SpaceHelpers.verticalNormal,
                MyTextLabel(texts.label.code),
                MyTextData(model.booking.bookingCode),
                //
                SpaceHelpers.verticalSmall,
                MyTextLabel(texts.label.service),
                MyTextData(model.booking.serviceDescription),
                //
                SpaceHelpers.verticalSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextLabel(texts.label.date),
                        MyTextData(Helpers.formatDate(model.booking.date)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextLabel(texts.label.Time),
                        MyTextData(
                            '${model.booking.initialTime}  -  ${model.booking.finalTime}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SpaceHelpers.verticalNormal,
          // Icon(Icons.down)
          MyCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MyTextSubtitle(texts.label.clientData),
                SpaceHelpers.verticalNormal,
                MyTextData(model.booking.name),

                // MyText(
                // model.booking.name,
                // ),
                SpaceHelpers.verticalSmall,
                Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Palette.green1,
                    ),
                    SpaceHelpers.horizontalSmall,
                    MyTextData(model.booking.phoneNumber),
                  ],
                ),
                SpaceHelpers.verticalSmall,
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Palette.colorApp,
                    ),
                    SpaceHelpers.horizontalSmall,
                    MyTextData(model.booking.emailAddress ??
                        texts.label.noInformation),
                  ],
                ),
              ],
            ),
          ),
          SpaceHelpers.verticalNormal,
          Divider(),
          Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Palette.colorApp,
            size: 50,
          ),

          SpaceHelpers.verticalNormal,
          MyCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MyTextSubtitle(texts.label.newProgramming),
                SpaceHelpers.verticalNormal,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextLabel(texts.label.date),
                        MyTextData(Helpers.formatDate(model.date)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextLabel(texts.label.Time),
                        MyTextData(
                            '${model.turnSelected.initialTurn}  -  ${model.turnSelected.finalTurn}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SpaceHelpers.verticalVeryLong,
          MyButtom(
            texts.label.rescheduleAppointment,
            onTap: () => _onTapReschedule(context),
          ),
          SpaceHelpers.verticalVeryLong,
        ],
      ),
    );
  }

  void _onTapReschedule(BuildContext context) async {
    final bloc = context.read<RescheduleConfirmationBloc>();
    final bool response = await Loader.showLoader(context, bloc.reschedule());
    if (!context.mounted) return;
    if (!response) return;
    // context.push(RescheduleBookingPage.route, extra: booking);
    context.go(NavigatorPage.route);
  }
}
