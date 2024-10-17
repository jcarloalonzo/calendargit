import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/new_worker_step_one_screen_model.dart';

part 'new_worker_step_one_state.freezed.dart';

@freezed
class NewWorkerStepOneState with _$NewWorkerStepOneState {
  factory NewWorkerStepOneState.loading() = NewWorkerStepOneStateLoading;
  factory NewWorkerStepOneState.failed([String? failure]) =
      NewWorkerStepOneStateFailed;
  factory NewWorkerStepOneState.loaded({
    ErrorModel? error,
    required NewWorkerStepOneScreenModel model,
  }) = NewWorkerStepOneStateLoaded;
}
