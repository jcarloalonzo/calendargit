import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'new_worker_step_one_state.dart';
import 'screen_model/new_worker_step_one_screen_model.dart';

part 'new_worker_step_one_event.freezed.dart';

@freezed
class NewWorkerStepOneEvent with _$NewWorkerStepOneEvent {
  const factory NewWorkerStepOneEvent.setError({required ErrorModel? error}) =
      NewWorkerStepOneSetErrorEvent;
  const factory NewWorkerStepOneEvent.changeState(NewWorkerStepOneState state) =
      NewWorkerStepOneChangeStateEvent;

  const factory NewWorkerStepOneEvent.updateModel(
          {required NewWorkerStepOneScreenModel model}) =
      NewWorkerStepOneUpdateModelEvent;
}
