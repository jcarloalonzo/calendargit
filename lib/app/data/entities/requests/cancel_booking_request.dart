import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_booking_request.freezed.dart';
part 'cancel_booking_request.g.dart';

@freezed
class CancelBookingRequest with _$CancelBookingRequest {
  const factory CancelBookingRequest({
    @JsonKey(name: 'user') required int user,
    @JsonKey(name: 'businessID') required int businessId,
    @JsonKey(name: 'businessIdent') required String businessIdent,
    @JsonKey(name: 'reason') required String reason,
  }) = _CancelBookingRequest;

  factory CancelBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingRequestFromJson(json);
}
