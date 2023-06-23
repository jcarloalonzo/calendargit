import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_custom_loading.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';
import 'components/cabecera_schedule_container.dart';
import 'components/calendar_schedule_widget.dart';
import 'components/list_card_item_schedule.dart';
import 'schedule_bloc.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ScheduleBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          color: Palette.colorApp,
          child: Row(
            children: [
              const SizedBox(width: 20),
              CabeceraScheduleContainer(fechaSelected: bloc.fechaSelected),
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
        const CalendarScheduleWidget(),
        (bloc.isLoadingBookings)
            ? const Flexible(child: MyCustomLoading())
            : _BodyListSchedule()
      ],
    );
  }
}

class _BodyListSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lista = Provider.of<ScheduleBloc>(context, listen: true).bookings;
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
                  return ListCardItemSchedule(booking: lista[i]);
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
