import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_booking_request.freezed.dart';
part 'complete_booking_request.g.dart';

@freezed
class CompleteBookingRequest with _$CompleteBookingRequest {
  const factory CompleteBookingRequest({
    @JsonKey(name: 'AuthorizedUser') required int authorizedUser,
    @JsonKey(name: 'businessID') required int businessId,
    @JsonKey(name: 'businessIdent') required String businessIdent,
    @JsonKey(name: 'officeID') required int officeId,
  }) = _CompleteBookingRequest;

  factory CompleteBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteBookingRequestFromJson(json);
}
