import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_list_request.freezed.dart';

@freezed
class BookingListRequest with _$BookingListRequest {
  const factory BookingListRequest({
    required int businessId,
    required int personId,
    required DateTime initialDate,
    required DateTime finalDate,
    required int bookingStateId,
  }) = _BookingListRequest;
}
