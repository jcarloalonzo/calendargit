import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../core/config/Utils.dart';
import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../bloc/schedule_bloc.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_custom_loading.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';
import '../../widgets/sin_datos_container.dart';
import 'schedule_widgets.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ElevatedButton(
        //     onPressed: () {
        //       final prefs = PreferencesUser();
        //       prefs.dispose();
        //     },
        //     child: const Text('text')),
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          color: Palette.colorApp,
          child: Row(
            children: [
              const SizedBox(width: 20),
              _BuildCabecera(bloc: bloc),
              if (bloc.calculaDayString() != null)
                MyCardContainer(
                  backgroundColor: Palette.lightBlue,
                  child: MyText(
                    text: bloc.calculaDayString()!,
                    color: Palette.blue1,
                    fontWeight: FontWeight.w600,
                    size: SizeText.text3,
                  ),
                )
            ],
          ),
        ),
        _CalendarSchedule(),
        (bloc.isLoadingBookings)
            ? const Flexible(child: MyCustomLoading())
            : (bloc.listBooking.isNotEmpty)
                ? _BodyListSchedule()
                : const SinDatosContainer(),
      ],
    );
  }
}

class _BodyListSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lista = Provider.of<ScheduleBloc>(context, listen: true).listBooking;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildRowHoraServicio(context),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                // physics: ClampingScrollPhysics(),
                // physics: PageScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                physics: const BouncingScrollPhysics(),
                // physics: AlwaysScrollableScrollPhysics(),
                itemCount: lista.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return ListCardItemSchedule(
                    obj: lista[i],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRowHoraServicio(BuildContext ctx) {
    return Row(
      children: const [
        Expanded(
          flex: 1,
          child: MyText(
            text: 'Hora',
            textAlign: TextAlign.center,
            color: Palette.blue4,
            size: SizeText.text4 + 1,
            fontWeight: FontWeight.w500,
          ),
        ),
        MySizedBoxWidth(),
        Expanded(
          flex: 3,
          child: MyText(
            text: 'Servicio',
            color: Palette.blue4,
            size: SizeText.text4 + 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _CalendarSchedule extends StatelessWidget {
  _CalendarSchedule();
  final CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return Container(
      color: Colors.transparent,
      height: 100,
      child: CalendarAgenda(
        fullCalendar: false,
        backgroundColor: Colors.transparent,
        controller: _calendarAgendaControllerNotAppBar,
        locale: 'es',
        weekDay: WeekDay.short,
        fullCalendarScroll: FullCalendarScroll.vertical,
        fullCalendarDay: WeekDay.short,
        selectedDateColor: Palette.blue6,
        leftMargin: 0,
        dateColor: Colors.black,
        padding: 0,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().add(const Duration(days: -3)),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        calendarBackground: Colors.black,
        calendarEventColor: Colors.black,
        calendarEventSelectedColor: Palette.blue6,
        appbar: false,
        selectedDayPosition: SelectedDayPosition.center,
        onDateSelected: (date) async {
          bloc.fechaSelected = MyUtils.formatDate(date);
          await bloc.getBookingsPickDate();
        },
      ),
    );
  }
}

class _BuildCabecera extends StatelessWidget {
  const _BuildCabecera({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ScheduleBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          MyText(
            text: Jiffy(bloc.fechaSelected).format('d'),
            color: Palette.white,
            size: 70,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: MyUtils.firstUpper(Jiffy(bloc.fechaSelected).EEEE),
                color: Palette.white,
                size: SizeText.text4 + 1,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 5),
              MyText(
                text: MyUtils.firstUpper(
                    Jiffy(bloc.fechaSelected).format('MMMM yyyy')),
                color: Palette.white,
                size: SizeText.text4 + 1,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
