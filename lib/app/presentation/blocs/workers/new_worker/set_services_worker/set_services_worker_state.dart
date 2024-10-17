import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/set_services_worker_screen_model.dart';

part 'set_services_worker_state.freezed.dart';

@freezed
class SetServicesWorkerState with _$SetServicesWorkerState {
  factory SetServicesWorkerState.loading() = SetServicesWorkerStateLoading;
  factory SetServicesWorkerState.failed([String? failure]) =
      SetServicesWorkerStateFailed;
  factory SetServicesWorkerState.loaded({
    ErrorModel? error,
    required SetServicesWorkerScreenModel model,
  }) = SetServicesWorkerStateLoaded;
}
