import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_turn_appointment.freezed.dart';
part 'professional_turn_appointment.g.dart';

@freezed
class ProfessionalTurnAppointment with _$ProfessionalTurnAppointment {
  const factory ProfessionalTurnAppointment({
    @JsonKey(name: 'initialTurn') required String initialTurn,
    @JsonKey(name: 'finalTurn') required String finalTurn,
    @JsonKey(name: 'state') required int state,
  }) = _ProfessionalTurnAppointment;

  factory ProfessionalTurnAppointment.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalTurnAppointmentFromJson(json);
}
