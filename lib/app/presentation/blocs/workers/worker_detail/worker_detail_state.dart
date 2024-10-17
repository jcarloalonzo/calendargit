import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/worker_detail_screen_model.dart';

part 'worker_detail_state.freezed.dart';

@freezed
class WorkerDetailState with _$WorkerDetailState {
  factory WorkerDetailState.loading() = WorkerDetailStateLoading;
  factory WorkerDetailState.failed([String? failure]) = WorkerDetailStateFailed;
  factory WorkerDetailState.loaded({
    ErrorModel? error,
    required WorkerDetailScreenModel model,
  }) = WorkerDetailStateLoaded;
}
