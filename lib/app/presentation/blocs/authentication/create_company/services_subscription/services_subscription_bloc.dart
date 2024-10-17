import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../config/helpers/helpers.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../data/entities/requests/company_create_request.dart';
import '../../../../../data/entities/responses/services_category_response.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../../../../../domain/models/business.dart';
import '../../../../../domain/models/category.dart';
import '../../../../../domain/usecases/provider/provider_sincronization_token_usecase.dart';
import '../../../../../domain/usecases/web_client/web_client_company_create_usecase.dart';
import '../../../../../domain/usecases/web_client/web_client_services_by_categories_usecase.dart';
import '../../../general/session/session_bloc.dart';
import '../categories_subscription/screen_model/categories_subscription_screen_model.dart';
import 'screen_model/services_subscription_screen_model.dart';
import 'services_subscription_event.dart';
import 'services_subscription_state.dart';

class ServicesSubscriptionBloc
    extends Bloc<ServicesSubscriptionEvent, ServicesSubscriptionState> {
  ServicesSubscriptionBloc({
    required WebClientServicesByCategoriesUsecase
        webClientServicesByCategoriesUsecase,
    required WebClientCompanyCreateUsecase webClientCompanyCreateUsecase,
    required ProviderSincronizationTokenUsecase
        providerSincronizationTokenUsecase,
  })  : _webClientServicesByCategoriesUsecase =
            webClientServicesByCategoriesUsecase,
        _webClientCompanyCreateUsecase = webClientCompanyCreateUsecase,
        _providerSincronizationTokenUsecase =
            providerSincronizationTokenUsecase,
        super(ServicesSubscriptionState.loading()) {
    on<ServicesSubscriptionSetErrorEvent>(_servicesSubscriptionSetErrorEvent);
    on<ServicesSubscriptionChangeStateEvent>(
        _servicesSubscriptionChangeStateEvent);
    on<ServicesSubscriptionUpdateModelEvent>(
        _servicesSubscriptionUpdateModelEvent);
  }
  final WebClientServicesByCategoriesUsecase
      _webClientServicesByCategoriesUsecase;
  final WebClientCompanyCreateUsecase _webClientCompanyCreateUsecase;
  final ProviderSincronizationTokenUsecase _providerSincronizationTokenUsecase;
  //
  //
  void _servicesSubscriptionSetErrorEvent(
      ServicesSubscriptionSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as ServicesSubscriptionStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _servicesSubscriptionChangeStateEvent(
      ServicesSubscriptionChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _servicesSubscriptionUpdateModelEvent(
      ServicesSubscriptionUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as ServicesSubscriptionStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const ServicesSubscriptionSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(ServicesSubscriptionSetErrorEvent(error: error));
  }

  void _updateModel(ServicesSubscriptionScreenModel model) {
    add(ServicesSubscriptionUpdateModelEvent(model: model));
  }

  ServicesSubscriptionScreenModel get _currentModel =>
      (state as ServicesSubscriptionStateLoaded).model;

  void init({required CategoriesSubscriptionScreenModel stepModel}) async {
    try {
      final services =
          await _getServicesCategories(stepModel.categoriesSelected);
      print(services);

      final model = ServicesSubscriptionScreenModel(
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
        username: stepModel.username,
        password: stepModel.password,
        categoriesSelected: stepModel.categoriesSelected,
        services: services,
      );

      add(ServicesSubscriptionChangeStateEvent(
          ServicesSubscriptionState.loaded(model: model)));
    } catch (e) {
      add(ServicesSubscriptionChangeStateEvent(
          ServicesSubscriptionState.failed()));
    }
  }

  bool exists(ServicesCategoryResponse item) {
    final response = _currentModel.servicesSelected
        .indexWhere((e) => e.serviceId == item.serviceId);
    if (response == -1) return false;
    return true;
  }

  void onTapChip(ServicesCategoryResponse item) {
    if (exists(item)) {
      _removeItemServiceSelected(item);
    } else {
      _addItemServiceSelected(item);
    }
  }

  void _removeItemServiceSelected(ServicesCategoryResponse item) {
    List<ServicesCategoryResponse> servicesSelected =
        _currentModel.servicesSelected.toList();
    servicesSelected.remove(item);
    final model = _currentModel.copyWith(servicesSelected: servicesSelected);
    _updateModel(model);
  }

  void _addItemServiceSelected(ServicesCategoryResponse item) {
    List<ServicesCategoryResponse> servicesSelected =
        _currentModel.servicesSelected.toList();
    servicesSelected.add(item);
    final model = _currentModel.copyWith(servicesSelected: servicesSelected);
    _updateModel(model);
  }

  Future<List<ServicesCategoryResponse>> _getServicesCategories(
      List<Category> categories) async {
    // final categoriesSelected = _currentModel.categoriesSelected;
    final response = await _webClientServicesByCategoriesUsecase.call(
        categories: categories);
    return response.when(
      left: (failure) {
        setError(failure);
        return [];
      },
      right: (value) {
        return value;
      },
    );
  }

  Future<Business?> register() async {
    try {
      final business = await _createCompany();
      if (business == null) return null;

      await _sincronization();
      return business;
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return null;
    }
  }

  Future<Business?> _createCompany() async {
    CompanyCreateRequest request = CompanyCreateRequest(
      identification: _currentModel.identification,
      businessTypeId: 1,
      businessName: _currentModel.companyName.trim(),
      emailAddress: _currentModel.contactEmail.trim(),
      legalName: _currentModel.legalName.trim(),
      phoneNumber: _currentModel.companyPhone.trim(),
      contactPhoneNumber: _currentModel.contactPhone.trim(),
      contactPersonName: _currentModel.contactName.trim(),
      codeuid: _currentModel.codeUID,
      active: true,
      officeName: _currentModel.officeName.trim(),
      officePhone: _currentModel.officePhone.trim(),
      adress: _currentModel.officeAddess.trim(),
      userLogin: _currentModel.username.trim(),
      userPassToken: _currentModel.password.trim(),
      categoriesIds:
          Helpers.catogoriesToIdRequest(_currentModel.categoriesSelected),
      servicesIds:
          Helpers.servicesCategoriesToIdRequest(_currentModel.servicesSelected),
    );

    final response =
        await _webClientCompanyCreateUsecase.call(request: request);

    return response.when(
      left: (failure) {
        setError(failure);
        return null;
      },
      right: (value) {
        getIt<SessionBloc>().updateBusiness(business: value);
        return value;
      },
    );
  }

  Future<void> _sincronization() async {
    final token = _currentModel.codeUID.trim();

    final response =
        await _providerSincronizationTokenUsecase.call(token: token);
    response.when(
      left: (failure) {
        throw 'Error';
      },
      right: (value) {
        if (!value) throw 'Error';
      },
    );
  }
}
