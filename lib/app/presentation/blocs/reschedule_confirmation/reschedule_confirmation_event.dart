import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'reschedule_confirmation_state.dart';
import 'screen_model/reschedule_confirmation_screen_model.dart';

part 'reschedule_confirmation_event.freezed.dart';

@freezed
class RescheduleConfirmationEvent with _$RescheduleConfirmationEvent {
  const factory RescheduleConfirmationEvent.setError(
      {required ErrorModel? error}) = RescheduleConfirmationSetErrorEvent;
  const factory RescheduleConfirmationEvent.changeState(
          RescheduleConfirmationState state) =
      RescheduleConfirmationChangeStateEvent;

  const factory RescheduleConfirmationEvent.updateModel(
          {required RescheduleConfirmationScreenModel model}) =
      RescheduleConfirmationUpdateModelEvent;
}
