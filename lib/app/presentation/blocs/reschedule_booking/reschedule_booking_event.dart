import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'reschedule_booking_state.dart';
import 'screen_model/reschedule_booking_screen_model.dart';

part 'reschedule_booking_event.freezed.dart';

@freezed
class RescheduleBookingEvent with _$RescheduleBookingEvent {
  const factory RescheduleBookingEvent.setError({required ErrorModel? error}) =
      RescheduleBookingSetErrorEvent;
  const factory RescheduleBookingEvent.changeState(
      RescheduleBookingState state) = RescheduleBookingChangeStateEvent;

  const factory RescheduleBookingEvent.updateModel(
          {required RescheduleBookingScreenModel model}) =
      RescheduleBookingUpdateModelEvent;
}
