import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../request_office/screen_model/request_office_screen_model.dart';
import 'request_login_event.dart';
import 'request_login_state.dart';
import 'screen_model/request_login_screen_model.dart';

class RequestLoginBloc extends Bloc<RequestLoginEvent, RequestLoginState> {
  RequestLoginBloc() : super(RequestLoginState.loading()) {
    on<RequestLoginSetErrorEvent>(_requestLoginSetErrorEvent);
    on<RequestLoginChangeStateEvent>(_requestLoginChangeStateEvent);
    on<RequestLoginUpdateModelEvent>(_requestLoginUpdateModelEvent);
  }

  void _requestLoginSetErrorEvent(
      RequestLoginSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestLoginStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _requestLoginChangeStateEvent(
      RequestLoginChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _requestLoginUpdateModelEvent(
      RequestLoginUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestLoginStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const RequestLoginSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RequestLoginSetErrorEvent(error: error));
  }

  void _updateModel(RequestLoginScreenModel model) {
    add(RequestLoginUpdateModelEvent(model: model));
  }

  RequestLoginScreenModel get _currentModel =>
      (state as RequestLoginStateLoaded).model;

  void init({required RequestOfficeScreenModel stepModel}) {
    try {
      final model = RequestLoginScreenModel(
        identification: stepModel.identification,
        codeUID: stepModel.codeUID,
        companyName: stepModel.companyName,
        companyPhone: stepModel.companyPhone,
        contactEmail: stepModel.contactEmail,
        contactName: stepModel.contactName,
        contactPhone: stepModel.contactPhone,
        legalName: stepModel.legalName,
        website: stepModel.website,
        officeAddess: stepModel.officeAddess,
        officeName: stepModel.officeName,
        officePhone: stepModel.officePhone,
      );

      add(RequestLoginChangeStateEvent(RequestLoginState.loaded(model: model)));
    } catch (e) {
      add(RequestLoginChangeStateEvent(RequestLoginState.failed()));
    }
  }

  void setUsername(String value) {
    final model = _currentModel.copyWith(username: value);
    _updateModel(model);
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

  RequestLoginScreenModel? modelData() {
    final validate = _validateForm();
    if (!validate) return null;
    final model = RequestLoginScreenModel(
      identification: _currentModel.identification.trim(),
      codeUID: _currentModel.codeUID.toUpperCase().trim(),
      companyName: _currentModel.companyName.toUpperCase().trim(),
      companyPhone: _currentModel.companyPhone.toUpperCase().trim(),
      contactEmail: _currentModel.contactEmail.toUpperCase().trim(),
      contactName: _currentModel.contactName.toUpperCase().trim(),
      contactPhone: _currentModel.contactPhone.toUpperCase().trim(),
      legalName: _currentModel.legalName.toUpperCase().trim(),
      website: _currentModel.website.toUpperCase().trim(),
      //
      officeAddess: _currentModel.officeAddess.toUpperCase().trim(),
      officeName: _currentModel.officeName.toUpperCase().trim(),
      officePhone: _currentModel.officePhone.toUpperCase().trim(),
      //
      username: _currentModel.username.trim(),
      password: _currentModel.password.trim(),
    );
    return model;
  }
}
