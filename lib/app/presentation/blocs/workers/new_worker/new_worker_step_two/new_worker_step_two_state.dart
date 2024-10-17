import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/new_worker_step_two_screen_model.dart';

part 'new_worker_step_two_state.freezed.dart';

@freezed
class NewWorkerStepTwoState with _$NewWorkerStepTwoState {
  factory NewWorkerStepTwoState.loading() = NewWorkerStepTwoStateLoading;
  factory NewWorkerStepTwoState.failed([String? failure]) =
      NewWorkerStepTwoStateFailed;
  factory NewWorkerStepTwoState.loaded({
    ErrorModel? error,
    required NewWorkerStepTwoScreenModel model,
  }) = NewWorkerStepTwoStateLoaded;
}
