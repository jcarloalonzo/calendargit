import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/space_helpers.dart';
import '../../../blocs/general/bookings/bookings_bloc.dart';
import '../../../blocs/general/bookings/screen_model/bookings_screen_model.dart';
import '../../../widgets/util/loader.dart';
import 'components/cabecera_schedule_container.dart';
import 'components/calendar_schedule_widget.dart';
import 'components/home_booking_items_list_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.model});
  final BookingsScreenModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CabeceraScheduleContainer(date: model.date),
        CalendarScheduleWidget(
          date: model.date,
          onTapDate: (date) => _changeDate(context, date),
        ),
        Expanded(
          child: HomeBookingItemsListContainer(
            bookings: model.bookings,
          ),
        ),
        SpaceHelpers.verticalVeryLong,
      ],
    );
  }

  void _changeDate(BuildContext context, DateTime date) async {
    final bloc = context.read<BookingsBloc>();
    bloc.setDate(date);
    await Loader.showLoader(context, bloc.getBookingsList(date: date));
  }
}
