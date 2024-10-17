import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../data/services/local/secure_storage_service.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../../../../../domain/models/company.dart';
import '../../../../../domain/usecases/provider/provider_company_by_token_usecase.dart';
import 'request_company_event.dart';
import 'request_company_state.dart';
import 'screen_model/request_company_screen_model.dart';

class RequestCompanyBloc
    extends Bloc<RequestCompanyEvent, RequestCompanyState> {
  RequestCompanyBloc({
    required ProviderCompanyByTokenUsecase providerCompanyByTokenUsecase,
  })  : _providerCompanyByTokenUsecase = providerCompanyByTokenUsecase,
        super(RequestCompanyState.loading()) {
    on<RequestCompanySetErrorEvent>(_requestCompanySetErrorEvent);
    on<RequestCompanyChangeStateEvent>(_requestCompanyChangeStateEvent);
    on<RequestCompanyUpdateModelEvent>(_requestCompanyUpdateModelEvent);
  }
  final ProviderCompanyByTokenUsecase _providerCompanyByTokenUsecase;

  void _requestCompanySetErrorEvent(
      RequestCompanySetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestCompanyStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _requestCompanyChangeStateEvent(
      RequestCompanyChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _requestCompanyUpdateModelEvent(
      RequestCompanyUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RequestCompanyStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const RequestCompanySetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RequestCompanySetErrorEvent(error: error));
  }

  void _updateModel(RequestCompanyScreenModel model) {
    add(RequestCompanyUpdateModelEvent(model: model));
  }

  RequestCompanyScreenModel get _currentModel =>
      (state as RequestCompanyStateLoaded).model;

  void init() async {
    try {
      final String? token = await getIt<SecureStorageService>().getToken();
      final Company? company = await _companyByToken(token!);
      if (company == null) throw 'Erorr';
      final model = RequestCompanyScreenModel(
        identification: company.identification.trim(),
        codeUID: company.codeUid.trim().toUpperCase(),
        companyName: company.companyName.trim(),
        legalName: company.companyName.trim(),
        website: company.webSite.trim(),
        companyPhone: company.phoneNumber?.trim() ?? '',
        contactEmail: company.companyContact?.emailAdress.trim() ?? '',
        contactName: company.companyContact?.name.trim() ?? '',
        contactPhone: company.companyContact?.phoneNumber.trim() ?? '',
        officeAddress: company.companyAddress?.adress.trim() ?? '',
        officePhone: company.companyAddress?.telephone.trim() ?? '',
      );

      add(RequestCompanyChangeStateEvent(
          RequestCompanyState.loaded(model: model)));
    } catch (e) {
      add(RequestCompanyChangeStateEvent(RequestCompanyState.failed()));
    }
  }

  void setNameCompany(String value) {
    final model = _currentModel.copyWith(companyName: value);
    _updateModel(model);
  }

  void setLegalName(String value) {
    final model = _currentModel.copyWith(legalName: value);
    _updateModel(model);
  }

  void setWebSite(String value) {
    final model = _currentModel.copyWith(website: value);
    _updateModel(model);
  }

  void setCompanyPhone(String value) {
    final model = _currentModel.copyWith(companyPhone: value);
    _updateModel(model);
  }

  void setContactEmail(String value) {
    final model = _currentModel.copyWith(contactEmail: value);
    _updateModel(model);
  }

  void setContactPhone(String value) {
    final model = _currentModel.copyWith(contactPhone: value);
    _updateModel(model);
  }

  void setContactName(String value) {
    final model = _currentModel.copyWith(contactName: value);
    _updateModel(model);
  }

  bool _validateForm() {
    if (_currentModel.companyName.isEmpty) {
      setError(texts.messages.youMustEnterTheNameOfTheCompany);
      return false;
    }

    if (_currentModel.legalName.isEmpty) {
      setError(texts.messages.youMustEnterTheLegalName);
      return false;
    }
    return true;
  }

  RequestCompanyScreenModel? modelData() {
    final validate = _validateForm();
    if (!validate) return null;
    final model = RequestCompanyScreenModel(
      identification: _currentModel.identification.trim(),
      codeUID: _currentModel.codeUID.toUpperCase().trim(),
      companyName: _currentModel.companyName.toUpperCase().trim(),
      companyPhone: _currentModel.companyPhone.toUpperCase().trim(),
      contactEmail: _currentModel.contactEmail.toUpperCase().trim(),
      contactName: _currentModel.contactName.toUpperCase().trim(),
      contactPhone: _currentModel.contactPhone.toUpperCase().trim(),
      legalName: _currentModel.legalName.toUpperCase().trim(),
      website: _currentModel.website.toUpperCase().trim(),
      officeAddress: _currentModel.officeAddress.toUpperCase().trim(),
      officePhone: _currentModel.officePhone.toUpperCase().trim(),
    );
    return model;
  }

  Future<Company?> _companyByToken(String token) async {
    final response = await _providerCompanyByTokenUsecase.call(token: token);
    return response.when(
      left: (failure) {
        return null;
      },
      right: (company) {
        // Guardando en memoria
        // getIt<SessionBloc>().updateCompany(company: company);
        return company;
      },
    );
  }
}
