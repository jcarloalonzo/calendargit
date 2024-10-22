import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/helpers/helpers.dart';
import '../../../../domain/models/professional_turn_appointment.dart';
import '../../../blocs/reschedule_booking/reschedule_booking_bloc.dart';
import 'program_shift_item_container.dart';

class ProgramsShiftsListContainer extends StatelessWidget {
  const ProgramsShiftsListContainer({
    super.key,
    this.turnSelected,
    required this.turns,
  });
  final ProfessionalTurnAppointment? turnSelected;
  final List<ProfessionalTurnAppointment> turns;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: turns.map((turn) {
        return ProgramShiftItemContainer(
          turn: turn,
          isSelected:
              Helpers.isSelectedShift(turn: turn, turnSelected: turnSelected),
          onTap: () => _onTapShift(context, turn: turn),
        );
      }).toList(),
    );
  }

  void _onTapShift(BuildContext context,
      {required ProfessionalTurnAppointment turn}) {
    final bloc = context.read<RescheduleBookingBloc>();
    if (turn.state == 0) return;
    bloc.setTurnSelected(turn);
  }
}
