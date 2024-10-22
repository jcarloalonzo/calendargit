import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'screen_model/reschedule_booking_screen_model.dart';

part 'reschedule_booking_state.freezed.dart';

@freezed
class RescheduleBookingState with _$RescheduleBookingState {
  factory RescheduleBookingState.loading() = RescheduleBookingStateLoading;
  factory RescheduleBookingState.failed([String? failure]) =
      RescheduleBookingStateFailed;
  factory RescheduleBookingState.loaded({
    ErrorModel? error,
    required RescheduleBookingScreenModel model,
  }) = RescheduleBookingStateLoaded;
}
