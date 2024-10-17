import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../../dependency_injection.dart';
import '../../../../domain/error_model/error_model.dart';
import '../../../../domain/models/business.dart';
import '../../../../domain/models/service_worker.dart';
import '../../../../domain/models/worker.dart';
import '../../../../domain/usecases/web_client/web_client_details_services_worker_usecase.dart';
import '../../general/session/session_bloc.dart';
import 'screen_model/worker_detail_screen_model.dart';
import 'worker_detail_event.dart';
import 'worker_detail_state.dart';

class WorkerDetailBloc extends Bloc<WorkerDetailEvent, WorkerDetailState> {
  WorkerDetailBloc(
      {required WebClientDetailsServicesWorkerUsecase
          webClientDetailsServicesWorkerUsecase})
      : _webClientDetailsServicesWorkerUsecase =
            webClientDetailsServicesWorkerUsecase,
        super(WorkerDetailState.loading()) {
    on<WorkerDetailSetErrorEvent>(_workerDetailSetErrorEvent);
    on<WorkerDetailChangeStateEvent>(_workerDetailChangeStateEvent);
    on<WorkerDetailUpdateModelEvent>(_workerDetailUpdateModelEvent);
  }
  final WebClientDetailsServicesWorkerUsecase
      _webClientDetailsServicesWorkerUsecase;

  void _workerDetailSetErrorEvent(
      WorkerDetailSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as WorkerDetailStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _workerDetailChangeStateEvent(
      WorkerDetailChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _workerDetailUpdateModelEvent(
      WorkerDetailUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as WorkerDetailStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const WorkerDetailSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(WorkerDetailSetErrorEvent(error: error));
  }

  void _updateModel(WorkerDetailScreenModel model) {
    add(WorkerDetailUpdateModelEvent(model: model));
  }

  WorkerDetailScreenModel get _currentModel =>
      (state as WorkerDetailStateLoaded).model;

  void init({required Worker worker}) async {
    try {
      final services = await _getServicesDetail(worker.personId);
      final model = WorkerDetailScreenModel(services: services, worker: worker);

      add(WorkerDetailChangeStateEvent(WorkerDetailState.loaded(model: model)));
    } catch (e) {
      add(WorkerDetailChangeStateEvent(WorkerDetailState.failed()));
    }
  }

  Future<List<ServiceWorker>> _getServicesDetail(int personId) async {
    final Business business = getIt<SessionBloc>().state.business!;
    final response = await _webClientDetailsServicesWorkerUsecase.call(
        businessId: business.businessId, personId: personId);
    return response.when(
      left: (failure) {
        throw 'Error';
      },
      right: (value) {
        return value;
      },
    );
  }
}
