import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'screen_model/reschedule_confirmation_screen_model.dart';

part 'reschedule_confirmation_state.freezed.dart';

@freezed
class RescheduleConfirmationState with _$RescheduleConfirmationState {
  factory RescheduleConfirmationState.loading() =
      RescheduleConfirmationStateLoading;
  factory RescheduleConfirmationState.failed([String? failure]) =
      RescheduleConfirmationStateFailed;
  factory RescheduleConfirmationState.loaded({
    ErrorModel? error,
    required RescheduleConfirmationScreenModel model,
  }) = RescheduleConfirmationStateLoaded;
}
