import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../config/app_config/space_helpers.dart';
import '../../../../generated/translations.g.dart';
import '../../blocs/reschedule_booking/reschedule_booking_bloc.dart';
import '../../blocs/reschedule_booking/screen_model/reschedule_booking_screen_model.dart';
import '../../widgets/message_observation_text.dart';
import '../../widgets/my_buttom.dart';
import '../../widgets/my_text.dart';
import '../../widgets/util/loader.dart';
import '../navigator/home/components/calendar_schedule_widget.dart';
import '../reschedule_confirmation/reschedule_confirmation_page.dart';
import 'components/programs_shift_list_container.dart';
import 'components/shift_item_container_legend.dart';

class RescheduleBookingBody extends StatelessWidget {
  const RescheduleBookingBody({super.key, required this.model});
  final RescheduleBookingScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CalendarScheduleWidget(
          date: model.date,
          onTapDate: (dateSelected) => onTapDate(context, dateSelected),
        ),
        SpaceHelpers.verticalNormal,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                texts.label.shifts,
                fontWeight: FontWeight.w700,
                size: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TurnoItemCircleLegend(
                      title: texts.label.Available,
                      colorCircle: Palette.available,
                    ),
                    SpaceHelpers.horizontalLong,
                    TurnoItemCircleLegend(
                      title: texts.label.notAvailable,
                      colorCircle: Palette.notAvailable,
                    ),
                    SpaceHelpers.horizontalLong,
                    TurnoItemCircleLegend(
                      title: texts.label.selected,
                      colorCircle: Palette.selected,
                    ),
                    SpaceHelpers.horizontalLong,
                  ],
                ),
              ),
              if (model.turns.isNotEmpty) ...[
                ProgramsShiftsListContainer(
                  turns: model.turns,
                  turnSelected: model.turnSelected,
                ),
                SpaceHelpers.verticalVeryLong,
                SpaceHelpers.verticalVeryLong,
                if (model.turnSelected != null)
                  MyButtom(
                    texts.label.continu,
                    onTap: () => _onTapContinue(context),
                  ),
              ] else ...[
                SpaceHelpers.verticalVeryLong,
                MessageObservationText(
                  title: texts
                      .messages.thereAreNoShiftsAvailableForTheSelectedDate,
                ),
              ],

              //
              //
            ],
          ),
        ),
      ],
    );
  }

  void onTapDate(BuildContext context, DateTime dateSelected) async {
    final bloc = context.read<RescheduleBookingBloc>();
    bloc.setDate(dateSelected);
    await Loader.showLoader(
        context, bloc.getShiftsProfessionalDate(date: dateSelected));
  }

  void _onTapContinue(BuildContext context) {
    context.push(RescheduleConfirmationPage.route, extra: model);
    //
  }
}
