import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_range_date_appointment.freezed.dart';
part 'professional_range_date_appointment.g.dart';

@freezed
class ProfessionalRangeDateAppointment with _$ProfessionalRangeDateAppointment {
  const factory ProfessionalRangeDateAppointment({
    @JsonKey(name: 'initialDate') required DateTime initialDate,
    @JsonKey(name: 'finalDate') required DateTime finalDate,
  }) = _ProfessionalRangeDateAppointment;

  factory ProfessionalRangeDateAppointment.fromJson(
          Map<String, dynamic> json) =>
      _$ProfessionalRangeDateAppointmentFromJson(json);
}
