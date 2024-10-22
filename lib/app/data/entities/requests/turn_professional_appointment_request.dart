import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_professional_appointment_request.freezed.dart';

@freezed
class TurnProfessionalAppointmentRequest
    with _$TurnProfessionalAppointmentRequest {
  const factory TurnProfessionalAppointmentRequest({
    required int personId,
    required int serviceId,
    required DateTime date,
  }) = _TurnProfessionalAppointmentRequest;
}
