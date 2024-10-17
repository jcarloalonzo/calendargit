import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../data/entities/requests/create_worker_request.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../../../../../domain/models/business.dart';
import '../../../../../domain/usecases/web_client/web_client_create_worker_usecase.dart';
import '../../../general/session/session_bloc.dart';
import '../new_worker_step_one/screen_model/new_worker_step_one_screen_model.dart';
import 'new_worker_step_two_event.dart';
import 'new_worker_step_two_state.dart';
import 'screen_model/new_worker_step_two_screen_model.dart';

class NewWorkerStepTwoBloc
    extends Bloc<NewWorkerStepTwoEvent, NewWorkerStepTwoState> {
  NewWorkerStepTwoBloc({
    required WebClientCreateWorkerUsecase webClientCreateWorkerUsecase,
  })  : _webClientCreateWorkerUsecase = webClientCreateWorkerUsecase,
        super(NewWorkerStepTwoState.loading()) {
    on<NewWorkerStepTwoSetErrorEvent>(_newWorkerStepTwoSetErrorEvent);
    on<NewWorkerStepTwoChangeStateEvent>(_newWorkerStepTwoChangeStateEvent);
    on<NewWorkerStepTwoUpdateModelEvent>(_newWorkerStepTwoUpdateModelEvent);
  }
  final WebClientCreateWorkerUsecase _webClientCreateWorkerUsecase;

  void _newWorkerStepTwoSetErrorEvent(
      NewWorkerStepTwoSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as NewWorkerStepTwoStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _newWorkerStepTwoChangeStateEvent(
      NewWorkerStepTwoChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _newWorkerStepTwoUpdateModelEvent(
      NewWorkerStepTwoUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as NewWorkerStepTwoStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const NewWorkerStepTwoSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(NewWorkerStepTwoSetErrorEvent(error: error));
  }

  void _updateModel(NewWorkerStepTwoScreenModel model) {
    add(NewWorkerStepTwoUpdateModelEvent(model: model));
  }

  NewWorkerStepTwoScreenModel get _currentModel =>
      (state as NewWorkerStepTwoStateLoaded).model;

  void init({required NewWorkerStepOneScreenModel stepModel}) {
    try {
      String name = stepModel.name.toLowerCase();
      String surname = stepModel.surname.toLowerCase();

      String user = '${name[0]}$surname';

      final model = NewWorkerStepTwoScreenModel(
        documentNumber: stepModel.documentNumber,
        name: stepModel.name,
        surname: stepModel.surname,
        phone: stepModel.phone,
        email: stepModel.email,
        username: user,
      );

      add(NewWorkerStepTwoChangeStateEvent(
          NewWorkerStepTwoState.loaded(model: model)));
    } catch (e) {
      add(NewWorkerStepTwoChangeStateEvent(NewWorkerStepTwoState.failed()));
    }
  }

  void setPassword(String value) {
    final model = _currentModel.copyWith(password: value);
    _updateModel(model);
  }

  bool _validateForm() {
    if (_currentModel.username.trim().isEmpty) {
      setError(texts.messages.youMustEnterTheUser);
      return false;
    }

    if (_currentModel.password.trim().isEmpty) {
      setError(texts.messages.youMustEnterThePassword);
      return false;
    }
    return true;
  }

  Future<int?> createWorker() async {
    try {
      final bool validate = _validateForm();
      if (!validate) return null;

      final Business business = getIt<SessionBloc>().state.business!;
      final userBusiness = getIt<SessionBloc>().state.user!.userBusinessData!;

      final request = CreateWorkerRequest(
        businessId: business.businessId,
        personTypeId: 2,
        documentNumber: _currentModel.documentNumber,
        name: _currentModel.name,
        surname: _currentModel.surname,
        secondSurname: '',
        phoneNumber: _currentModel.phone,
        emailAddress: _currentModel.email,
        description: '',
        officeId: userBusiness.officeId,
        user: _currentModel.username.trim(),
        password: _currentModel.password.trim(),
      );

      final response =
          await _webClientCreateWorkerUsecase.call(request: request);
      return response.when(
        left: (failure) {
          setError(failure);
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
