import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../data/entities/requests/set_services_worker_request.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../../../../../domain/models/service.dart';
import '../../../../../domain/usecases/web_client/web_client_services_by_business_usecase.dart';
import '../../../../../domain/usecases/web_client/web_client_set_Services_worker_usecase.dart';
import '../../../general/session/session_bloc.dart';
import 'screen_model/set_services_worker_screen_model.dart';
import 'set_services_worker_event.dart';
import 'set_services_worker_state.dart';

class SetServicesWorkerBloc
    extends Bloc<SetServicesWorkerEvent, SetServicesWorkerState> {
  SetServicesWorkerBloc({
    required WebClientServicesByBusinessUsecase
        webClientServicesByBusinessUsecase,
    required WebClientSetServicesWorkerUsecase
        webClientSetServicesWorkerUsecase,
  })  : _webClientServicesByBusinessUsecase =
            webClientServicesByBusinessUsecase,
        _webClientSetServicesWorkerUsecase = webClientSetServicesWorkerUsecase,
        super(SetServicesWorkerState.loading()) {
    on<SetServicesWorkerSetErrorEvent>(_setServicesWorkerSetErrorEvent);
    on<SetServicesWorkerChangeStateEvent>(_setServicesWorkerChangeStateEvent);
    on<SetServicesWorkerUpdateModelEvent>(_setServicesWorkerUpdateModelEvent);
  }
  final WebClientServicesByBusinessUsecase _webClientServicesByBusinessUsecase;
  final WebClientSetServicesWorkerUsecase _webClientSetServicesWorkerUsecase;
  void _setServicesWorkerSetErrorEvent(
      SetServicesWorkerSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as SetServicesWorkerStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _setServicesWorkerChangeStateEvent(
      SetServicesWorkerChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _setServicesWorkerUpdateModelEvent(
      SetServicesWorkerUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as SetServicesWorkerStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const SetServicesWorkerSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(SetServicesWorkerSetErrorEvent(error: error));
  }

  void _updateModel(SetServicesWorkerScreenModel model) {
    add(SetServicesWorkerUpdateModelEvent(model: model));
  }

  SetServicesWorkerScreenModel get _currentModel =>
      (state as SetServicesWorkerStateLoaded).model;

  void init({required int personId}) async {
    try {
      final services = await _getServices();
      final model = SetServicesWorkerScreenModel(
        personId: personId,
        services: services,
      );

      add(SetServicesWorkerChangeStateEvent(
          SetServicesWorkerState.loaded(model: model)));
    } catch (e) {
      add(SetServicesWorkerChangeStateEvent(SetServicesWorkerState.failed()));
    }
  }

  Future<List<Service>> _getServices() async {
    final int businessId = getIt<SessionBloc>().state.business!.businessId;
    final response =
        await _webClientServicesByBusinessUsecase.call(businessId: businessId);
    return response.when(
      left: (failure) {
        throw '';
      },
      right: (value) {
        return value;
      },
    );
  }

  bool exists(Service item) {
    final response = _currentModel.servicesSelected
        .indexWhere((e) => e.serviceId == item.serviceId);
    if (response == -1) return false;
    return true;
  }

  void onTapChip(Service item) {
    if (exists(item)) {
      _removeItemCategorySelected(item);
    } else {
      _addItemCategorySelected(item);
    }
  }

  void _removeItemCategorySelected(Service item) {
    List<Service> servicesSelected = _currentModel.servicesSelected.toList();
    servicesSelected.remove(item);
    final model = _currentModel.copyWith(servicesSelected: servicesSelected);
    _updateModel(model);
  }

  void _addItemCategorySelected(Service item) {
    List<Service> servicesSelected = _currentModel.servicesSelected.toList();
    servicesSelected.add(item);
    final model = _currentModel.copyWith(servicesSelected: servicesSelected);
    _updateModel(model);
  }

  Future<bool> setServicesWorker() async {
    try {
      final List<Service> servicesSelected =
          _currentModel.servicesSelected.toList();
      final request = SetServicesWorkerRequest(
        personId: _currentModel.personId,
        servicesIds: Helpers.servicesToIdRequest(servicesSelected),
      );

      final response =
          await _webClientSetServicesWorkerUsecase.call(request: request);
      return response.when(
        left: (failure) {
          setError(failure);
          return false;
        },
        right: (value) {
          return value;
        },
      );
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return false;
    }
  }
}
