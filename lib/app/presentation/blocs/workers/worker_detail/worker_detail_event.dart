import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/worker_detail_screen_model.dart';
import 'worker_detail_state.dart';

part 'worker_detail_event.freezed.dart';

@freezed
class WorkerDetailEvent with _$WorkerDetailEvent {
  const factory WorkerDetailEvent.setError({required ErrorModel? error}) =
      WorkerDetailSetErrorEvent;
  const factory WorkerDetailEvent.changeState(WorkerDetailState state) =
      WorkerDetailChangeStateEvent;

  const factory WorkerDetailEvent.updateModel(
      {required WorkerDetailScreenModel model}) = WorkerDetailUpdateModelEvent;
}
