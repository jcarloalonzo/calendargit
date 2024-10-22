import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/booking.dart';
import '../../../../domain/models/professional_turn_appointment.dart';

part 'reschedule_confirmation_screen_model.freezed.dart';

@freezed
class RescheduleConfirmationScreenModel
    with _$RescheduleConfirmationScreenModel {
  const factory RescheduleConfirmationScreenModel({
    required Booking booking,
    required DateTime date,
    required ProfessionalTurnAppointment turnSelected,
  }) = _RescheduleConfirmationScreenModel;
}
