import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/set_services_worker_screen_model.dart';
import 'set_services_worker_state.dart';

part 'set_services_worker_event.freezed.dart';

@freezed
class SetServicesWorkerEvent with _$SetServicesWorkerEvent {
  const factory SetServicesWorkerEvent.setError({required ErrorModel? error}) =
      SetServicesWorkerSetErrorEvent;
  const factory SetServicesWorkerEvent.changeState(
      SetServicesWorkerState state) = SetServicesWorkerChangeStateEvent;

  const factory SetServicesWorkerEvent.updateModel(
          {required SetServicesWorkerScreenModel model}) =
      SetServicesWorkerUpdateModelEvent;
}
