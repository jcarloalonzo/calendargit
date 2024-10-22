import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/booking.dart';
import '../../../../domain/models/professional_range_date_appointment.dart';
import '../../../../domain/models/professional_turn_appointment.dart';

part 'reschedule_booking_screen_model.freezed.dart';

@freezed
class RescheduleBookingScreenModel with _$RescheduleBookingScreenModel {
  const factory RescheduleBookingScreenModel({
    required Booking booking,
    required DateTime date,
    required ProfessionalRangeDateAppointment rangeDate,
    ProfessionalTurnAppointment? turnSelected,
    @Default([]) List<ProfessionalTurnAppointment> turns,
  }) = _RescheduleBookingScreenModel;
}
