import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/error_model/error_model.dart';
import 'new_worker_step_one_event.dart';
import 'new_worker_step_one_state.dart';
import 'screen_model/new_worker_step_one_screen_model.dart';

class NewWorkerStepOneBloc
    extends Bloc<NewWorkerStepOneEvent, NewWorkerStepOneState> {
  NewWorkerStepOneBloc() : super(NewWorkerStepOneState.loading()) {
    on<NewWorkerStepOneSetErrorEvent>(_newWorkerStepOneSetErrorEvent);
    on<NewWorkerStepOneChangeStateEvent>(_newWorkerStepOneChangeStateEvent);
    on<NewWorkerStepOneUpdateModelEvent>(_newWorkerStepOneUpdateModelEvent);
  }

  void _newWorkerStepOneSetErrorEvent(
      NewWorkerStepOneSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as NewWorkerStepOneStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _newWorkerStepOneChangeStateEvent(
      NewWorkerStepOneChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _newWorkerStepOneUpdateModelEvent(
      NewWorkerStepOneUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as NewWorkerStepOneStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const NewWorkerStepOneSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(NewWorkerStepOneSetErrorEvent(error: error));
  }

  void _updateModel(NewWorkerStepOneScreenModel model) {
    add(NewWorkerStepOneUpdateModelEvent(model: model));
  }

  NewWorkerStepOneScreenModel get _currentModel =>
      (state as NewWorkerStepOneStateLoaded).model;

  void init() {
    try {
      final model = NewWorkerStepOneScreenModel();

      add(NewWorkerStepOneChangeStateEvent(
          NewWorkerStepOneState.loaded(model: model)));
    } catch (e) {
      add(NewWorkerStepOneChangeStateEvent(NewWorkerStepOneState.failed()));
    }
  }

  void setDocumentNumber(String value) {
    final model = _currentModel.copyWith(documentNumber: value);
    _updateModel(model);
  }

  void setName(String value) {
    final model = _currentModel.copyWith(name: value);
    _updateModel(model);
  }

  void setSurname(String value) {
    final model = _currentModel.copyWith(surname: value);
    _updateModel(model);
  }

  void setPhone(String value) {
    final model = _currentModel.copyWith(phone: value);
    _updateModel(model);
  }

  void setEmail(String value) {
    final model = _currentModel.copyWith(email: value);
    _updateModel(model);
  }

  bool _validateForm() {
    if (_currentModel.documentNumber.trim().isEmpty) {
      setError(texts.messages.youMustEnterTheDocumentNumber);
      return false;
    }
    if (_currentModel.name.trim().isEmpty) {
      setError(texts.messages.youMustEnterTheName);
      return false;
    }
    if (_currentModel.surname.trim().isEmpty) {
      setError(texts.messages.youMustEnterTheSurname);
      return false;
    }
    return true;
  }

  NewWorkerStepOneScreenModel? modelData() {
    final validate = _validateForm();
    if (!validate) return null;
    final model = NewWorkerStepOneScreenModel(
      documentNumber: _currentModel.documentNumber.trim().toUpperCase(),
      name: _currentModel.name.trim().toUpperCase(),
      surname: _currentModel.surname.trim().toUpperCase(),
      phone: _currentModel.phone.trim(),
      email: _currentModel.email.trim().toUpperCase(),
    );
    return model;
  }
}
