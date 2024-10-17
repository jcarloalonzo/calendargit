import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../domain/error_model/error_model.dart';
import 'register_event.dart';
import 'register_state.dart';
import 'screen_model/register_screen_model.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.loading()) {
    on<RegisterSetErrorEvent>(_registerSetErrorEvent);
    on<RegisterChangeStateEvent>(_registerChangeStateEvent);
    on<RegisterUpdateModelEvent>(_registerUpdateModelEvent);
  }

  void _registerSetErrorEvent(
      RegisterSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RegisterStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _registerChangeStateEvent(
      RegisterChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _registerUpdateModelEvent(
      RegisterUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RegisterStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const RegisterSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RegisterSetErrorEvent(error: error));
  }

  void _updateModel(RegisterScreenModel model) {
    add(RegisterUpdateModelEvent(model: model));
  }

  RegisterScreenModel get _currentModel => (state as RegisterStateLoaded).model;

  void init() {
    try {
      final model = RegisterScreenModel();

      add(RegisterChangeStateEvent(RegisterStateLoaded(model: model)));
    } catch (e) {
      add(RegisterChangeStateEvent(RegisterStateFailed()));
    }
  }
}
