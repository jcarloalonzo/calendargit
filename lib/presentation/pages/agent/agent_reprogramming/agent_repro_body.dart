import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/data/models/entities/program_turn_model.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_widget.dart';
import 'package:calendario/presentation/widgets/contenedor_rectangle.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgentReproBody extends StatelessWidget {
  final CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  AgentReproBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ScheduleBloc>(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        children: [
          const MySizedBoxHeight(kDouble: 20),
          Row(
            children: const [
              MyText(
                text: 'Fechas',
                fontWeight: FontWeight.w700,
                size: SizeText.text3,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          if (bloc.rangeDatePerson != null)
            Container(
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
                initialDate: bloc.rangeDatePerson!.initialDate!,
                firstDate: bloc.rangeDatePerson!.initialDate!,
                lastDate: bloc.rangeDatePerson!.finalDate!,
                calendarBackground: Colors.black,
                calendarEventColor: Colors.black,
                calendarEventSelectedColor: Palette.blue6,
                selectedDayPosition: SelectedDayPosition.center,
                appbar: false,
                onDateSelected: (date) async {
                  await bloc.getProgramTurn(
                      date: MyUtils.formatDate(date), isInit: false);
                },
              ),
            ),
          const SizedBox(height: 15),
          Row(
            children: const [
              MyText(
                text: 'Turnos',
                fontWeight: FontWeight.w700,
                size: SizeText.text3,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const ListTurnColorWidget(),
          const SizedBox(height: 15),
          if (bloc.rangeDatePerson != null)
            (bloc.isLoadingTurn)
                ? const ContenedorRectangle(child: CircularProgressIndicator())
                : (bloc.lisProgramTurnModel.isNotEmpty)
                    ? GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bloc.lisProgramTurnModel.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) {
                          return _ProgramTurnContainer(
                            programTurn: bloc.lisProgramTurnModel[index],
                            colorCard: _getColor(
                                bloc, bloc.lisProgramTurnModel[index]),
                            onTap: (bloc.lisProgramTurnModel[index].state != 0)
                                ? () {
                                    // ignore: unrelated_type_equality_checks
                                    if ('${bloc.programTurnSelected?.initialTurn}'
                                            '${bloc.programTurnSelected?.finalTurn}' ==
                                        '${bloc.lisProgramTurnModel[index].initialTurn}'
                                            '${bloc.lisProgramTurnModel[index].finalTurn}') {
                                      bloc.programTurnSelected = null;
                                      // print(' es el mismo');
                                    } else {
                                      bloc.programTurnSelected =
                                          bloc.lisProgramTurnModel[index];
                                    }
                                  }
                                : null,
                          );
                        },
                      )
                    : const ContenedorRectangle(
                        child: MyText(
                          text: 'No hay turnos disponibles',
                          fontWeight: FontWeight.w500,
                          size: SizeText.text4 + 2,
                        ),
                      ),
          const SizedBox(height: 75),
        ],
      ),
    );
  }

  _getColor(ScheduleBloc bloc, ProgamTurnModel programTurn) {
    if (programTurn.state == 0) {
      return Palette.grey4;
    }

    // return Palette.orange;

    if (bloc.programTurnSelected != null) {
      if ('${bloc.programTurnSelected!.initialTurn}'
              '${bloc.programTurnSelected!.finalTurn}' ==
          '${programTurn.initialTurn}' '${programTurn.finalTurn}') {
        return Palette.blue2;
      } else {
        return Palette.green3;
      }
    } else {
      return Palette.green3;
    }
    // return Palette.green3;
  }
}

class _ProgramTurnContainer extends StatelessWidget {
  final ProgamTurnModel programTurn;
  final Function()? onTap;
  final Color? colorCard;

  const _ProgramTurnContainer({
    Key? key,
    required this.programTurn,
    this.onTap,
    this.colorCard = Palette.green3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: colorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: MyText(
            text: '${programTurn.initialTurn} - ${programTurn.finalTurn}',
            size: SizeText.text4 - 1,
          ),
        ),
      ),
    );
  }
}
