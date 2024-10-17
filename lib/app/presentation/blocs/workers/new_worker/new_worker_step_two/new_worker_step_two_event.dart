import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'new_worker_step_two_state.dart';
import 'screen_model/new_worker_step_two_screen_model.dart';

part 'new_worker_step_two_event.freezed.dart';

@freezed
class NewWorkerStepTwoEvent with _$NewWorkerStepTwoEvent {
  const factory NewWorkerStepTwoEvent.setError({required ErrorModel? error}) =
      NewWorkerStepTwoSetErrorEvent;
  const factory NewWorkerStepTwoEvent.changeState(NewWorkerStepTwoState state) =
      NewWorkerStepTwoChangeStateEvent;

  const factory NewWorkerStepTwoEvent.updateModel(
          {required NewWorkerStepTwoScreenModel model}) =
      NewWorkerStepTwoUpdateModelEvent;
}
