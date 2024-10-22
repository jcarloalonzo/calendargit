import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/booking.dart';

part 'bookings_screen_model.freezed.dart';

@freezed
class BookingsScreenModel with _$BookingsScreenModel {
  factory BookingsScreenModel({
    required List<Booking> bookings,
    required DateTime date,
  }) = _BookingsScreenModel;
}
