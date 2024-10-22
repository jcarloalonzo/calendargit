import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_booking_request.freezed.dart';
part 'reschedule_booking_request.g.dart';

@freezed
class RescheduleBookingRequest with _$RescheduleBookingRequest {
  const factory RescheduleBookingRequest({
    @JsonKey(name: 'User') required int user,
    @JsonKey(name: 'businessIdent') required String businessIdent,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'initialTime') required String initialTime,
    @JsonKey(name: 'finalTime') required String finalTime,
    @JsonKey(name: 'registerUser') required int registerUser,
  }) = _RescheduleBookingRequest;

  factory RescheduleBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$RescheduleBookingRequestFromJson(json);
}
