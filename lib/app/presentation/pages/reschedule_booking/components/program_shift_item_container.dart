import 'package:flutter/material.dart';

import '../../../../../../config/app_config/palette.dart';
import '../../../../domain/models/professional_turn_appointment.dart';
import '../../../widgets/my_text.dart';

class ProgramShiftItemContainer extends StatelessWidget {
  const ProgramShiftItemContainer({
    super.key,
    required this.turn,
    required this.isSelected,
    this.onTap,
  });
  final bool isSelected;
  final ProfessionalTurnAppointment turn;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: _getColor(),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: MyText(
          '${turn.initialTurn} - ${turn.finalTurn}',
          color: isSelected ? Colors.white : Palette.primaryColor,
          fontWeight: FontWeight.w500,
          // size: 14,
        ),
      ),
    );
  }

  Color _getColor() {
    if (turn.state == 0) {
      return Palette.notAvailable;
    }
    if (isSelected) return Palette.selected;
    return Palette.available;
  }
}
