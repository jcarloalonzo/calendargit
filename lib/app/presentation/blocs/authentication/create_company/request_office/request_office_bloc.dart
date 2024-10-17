import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../request_company/screen_model/request_company_screen_model.dart';
import 'request_office_event.dart';
import 'request_office_state.dart';
import 'screen_model/request_office_screen_model.dart';

class RequestOfficeBloc extends Bloc<RequestOfficeEvent, RequestOfficeState> {
  RequestOfficeBloc() : super(RequestOfficeState.loading()) {
    on<RequestOfficeSetErrorEvent>(_requestOfficeSetErrorEvent);
    on<RequestOfficeChangeStateEvent>(_requestOfficeChangeStateEvent);
    on<RequestOfficeUpdateModelEvent>(_requestOfficeUpdateModelEvent);
  }

  void _requestOfficeSetErrorEvent(
      RequestOfficeSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestOfficeStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _requestOfficeChangeStateEvent(
      RequestOfficeChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _requestOfficeUpdateModelEvent(
      RequestOfficeUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestOfficeStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
  void cleanError() {
    add(const RequestOfficeSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RequestOfficeSetErrorEvent(error: error));
  }

  void _updateModel(RequestOfficeScreenModel model) {
    add(RequestOfficeUpdateModelEvent(model: model));
  }

  RequestOfficeScreenModel get _currentModel =>
      (state as RequestOfficeStateLoaded).model;

  void init({required RequestCompanyScreenModel stepModel}) {
    try {
      final model = RequestOfficeScreenModel(
        identification: stepModel.identification,
        codeUID: stepModel.codeUID,
        companyName: stepModel.companyName,
        companyPhone: stepModel.companyPhone,
        contactEmail: stepModel.contactEmail,
        contactName: stepModel.contactName,
        contactPhone: stepModel.contactPhone,
        legalName: stepModel.legalName,
        website: stepModel.website,
        officeAddess: stepModel.officeAddress,
        officePhone: stepModel.officePhone,
      );

      add(RequestOfficeChangeStateEvent(
          RequestOfficeState.loaded(model: model)));
    } catch (e) {
      add(RequestOfficeChangeStateEvent(RequestOfficeState.failed()));
    }
  }

  void setOfficeName(String value) {
    final model = _currentModel.copyWith(officeName: value);
    _updateModel(model);
  }

  void setOfficeAddress(String value) {
    final model = _currentModel.copyWith(officeAddess: value);
    _updateModel(model);
  }

  void setOfficePhone(String value) {
    final model = _currentModel.copyWith(officePhone: value);
    _updateModel(model);
  }

  bool _validateForm() {
    if (_currentModel.officeName.trim().isEmpty) {
      setError(texts.messages.youMustEnterTheOfficeName);
      return false;
    }

    return true;
  }

  RequestOfficeScreenModel? modelData() {
    final validate = _validateForm();
    if (!validate) return null;
    final model = RequestOfficeScreenModel(
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
    );
    return model;
  }
}
