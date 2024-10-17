import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../../dependency_injection.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../domain/error_model/error_model.dart';
import '../../../../domain/models/business.dart';
import '../../../../domain/models/worker.dart';
import '../../../../domain/usecases/web_client/web_client_workers_usecase.dart';
import '../../general/session/session_bloc.dart';
import 'screen_model/workers_screen_model.dart';
import 'workers_event.dart';
import 'workers_state.dart';

class WorkersBloc extends Bloc<WorkersEvent, WorkersState> {
  WorkersBloc({required WebClientWorkersUsecase webClientWorkersUsecase})
      : _webClientWorkersUsecase = webClientWorkersUsecase,
        super(WorkersState.loading()) {
    on<WorkersSetErrorEvent>(_workersSetErrorEvent);
    on<WorkersChangeStateEvent>(_workersChangeStateEvent);
    on<WorkersUpdateModelEvent>(_workersUpdateModelEvent);
  }
  final WebClientWorkersUsecase _webClientWorkersUsecase;
  void _workersSetErrorEvent(
      WorkersSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as WorkersStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _workersChangeStateEvent(
      WorkersChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _workersUpdateModelEvent(
      WorkersUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as WorkersStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const WorkersSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(WorkersSetErrorEvent(error: error));
  }

  void _updateModel(WorkersScreenModel model) {
    add(WorkersUpdateModelEvent(model: model));
  }

  WorkersScreenModel get _currentModel => (state as WorkersStateLoaded).model;

  void init() async {
    try {
      final workers = await getWorkers();
      final model = WorkersScreenModel(
        workers: workers!,
      );

      add(WorkersChangeStateEvent(WorkersState.loaded(model: model)));
    } catch (e) {
      add(WorkersChangeStateEvent(WorkersState.failed()));
    }
  }

  Future<List<Worker>?> getWorkers() async {
    try {
      final Business business = getIt<SessionBloc>().state.business!;

      final response = await _webClientWorkersUsecase.call(
        businessId: business.businessId,
        personTypeId: 2,
      );

      return response.when(
        left: (failure) {
          return null;
        },
        right: (value) {
          return value;
        },
      );
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return null;
    }
  }
}
