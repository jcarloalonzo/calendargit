import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_config/enums.dart';
import '../../../../../../dependency_injection.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../data/entities/requests/company_create_request.dart';
import '../../../../../domain/error_model/error_model.dart';
import '../../../../../domain/models/business.dart';
import '../../../../../domain/models/category.dart';
import '../../../../../domain/usecases/provider/provider_sincronization_token_usecase.dart';
import '../../../../../domain/usecases/web_client/web_client_company_create_usecase.dart';
import '../../../../../domain/usecases/web_client/web_client_get_categories_usecase.dart';
import '../../../general/session/session_bloc.dart';
import '../request_login/screen_model/request_login_screen_model.dart';
import 'categories_subscription_event.dart';
import 'categories_subscription_state.dart';
import 'screen_model/categories_subscription_screen_model.dart';

class CategoriesSubscriptionBloc
    extends Bloc<CategoriesSubscriptionEvent, CategoriesSubscriptionState> {
  CategoriesSubscriptionBloc({
    required WebClientGetCategoriesUsecase webClientGetCategoriesUsecase,
    required WebClientCompanyCreateUsecase webClientCompanyCreateUsecase,
    required ProviderSincronizationTokenUsecase
        providerSincronizationTokenUsecase,
  })  : _webClientGetCategoriesUsecase = webClientGetCategoriesUsecase,
        _webClientCompanyCreateUsecase = webClientCompanyCreateUsecase,
        _providerSincronizationTokenUsecase =
            providerSincronizationTokenUsecase,
        super(CategoriesSubscriptionState.loading()) {
    on<CategoriesSubscriptionSetErrorEvent>(
        _categoriesSubscriptionSetErrorEvent);
    on<CategoriesSubscriptionChangeStateEvent>(
        _categoriesSubscriptionChangeStateEvent);
    on<CategoriesSubscriptionUpdateModelEvent>(
        _categoriesSubscriptionUpdateModelEvent);
  }
  final WebClientGetCategoriesUsecase _webClientGetCategoriesUsecase;
  final WebClientCompanyCreateUsecase _webClientCompanyCreateUsecase;
  final ProviderSincronizationTokenUsecase _providerSincronizationTokenUsecase;

  void _categoriesSubscriptionSetErrorEvent(
      CategoriesSubscriptionSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as CategoriesSubscriptionStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _categoriesSubscriptionChangeStateEvent(
      CategoriesSubscriptionChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _categoriesSubscriptionUpdateModelEvent(
      CategoriesSubscriptionUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as CategoriesSubscriptionStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const CategoriesSubscriptionSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(CategoriesSubscriptionSetErrorEvent(error: error));
  }

  void _updateModel(CategoriesSubscriptionScreenModel model) {
    add(CategoriesSubscriptionUpdateModelEvent(model: model));
  }

  CategoriesSubscriptionScreenModel get _currentModel =>
      (state as CategoriesSubscriptionStateLoaded).model;

  void init({required RequestLoginScreenModel stepModel}) async {
    try {
      final categories = await _getCategories();
      print(categories);
      final model = CategoriesSubscriptionScreenModel(
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
        categories: categories,
      );

      add(CategoriesSubscriptionChangeStateEvent(
          CategoriesSubscriptionState.loaded(model: model)));
    } catch (e) {
      add(CategoriesSubscriptionChangeStateEvent(
          CategoriesSubscriptionState.failed()));
    }
  }

  Future<List<Category>> _getCategories() async {
    final response = await _webClientGetCategoriesUsecase.call();
    return response.when(
      left: (failure) {
        throw 'Error';
      },
      right: (value) {
        return value;
      },
    );
  }

  bool exists(Category item) {
    final response = _currentModel.categoriesSelected
        .indexWhere((e) => e.categoryId == item.categoryId);
    if (response == -1) return false;
    return true;
  }

  void onTapChip(Category item) {
    if (exists(item)) {
      _removeItemCategorySelected(item);
    } else {
      _addItemCategorySelected(item);
    }
  }

  void _removeItemCategorySelected(Category item) {
    List<Category> categoriesSelected =
        _currentModel.categoriesSelected.toList();
    categoriesSelected.remove(item);
    final model =
        _currentModel.copyWith(categoriesSelected: categoriesSelected);
    _updateModel(model);
  }

  void _addItemCategorySelected(Category item) {
    List<Category> categoriesSelected =
        _currentModel.categoriesSelected.toList();
    categoriesSelected.add(item);
    final model =
        _currentModel.copyWith(categoriesSelected: categoriesSelected);
    _updateModel(model);
  }

  CategoriesSubscriptionScreenModel modelData() {
    final model = CategoriesSubscriptionScreenModel(
      codeUID: _currentModel.codeUID.trim(),
      identification: _currentModel.identification.trim(),
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
      //
      categories: _currentModel.categories,
      categoriesSelected: _currentModel.categoriesSelected,
    );
    return model;
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
      categoriesIds: [],
      servicesIds: [],
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
