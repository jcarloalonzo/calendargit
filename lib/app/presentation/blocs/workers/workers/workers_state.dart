import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/workers_screen_model.dart';

part 'workers_state.freezed.dart';

@freezed
class WorkersState with _$WorkersState {
  factory WorkersState.loading() = WorkersStateLoading;
  factory WorkersState.failed([String? failure]) = WorkersStateFailed;
  factory WorkersState.loaded({
    ErrorModel? error,
    required WorkersScreenModel model,
  }) = WorkersStateLoaded;
}
