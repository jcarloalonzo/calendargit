import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/booking.dart';

part 'booking_detail_screen_model.freezed.dart';

@freezed
class BookingDetailScreenModel with _$BookingDetailScreenModel {
  const factory BookingDetailScreenModel({
    required Booking booking,
  }) = _BookingDetailScreenModel;
}
