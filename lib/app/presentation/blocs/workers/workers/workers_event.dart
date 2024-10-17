import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/workers_screen_model.dart';
import 'workers_state.dart';

part 'workers_event.freezed.dart';

@freezed
class WorkersEvent with _$WorkersEvent {
  const factory WorkersEvent.setError({required ErrorModel? error}) =
      WorkersSetErrorEvent;
  const factory WorkersEvent.changeState(WorkersState state) =
      WorkersChangeStateEvent;

  const factory WorkersEvent.updateModel({required WorkersScreenModel model}) =
      WorkersUpdateModelEvent;
}
