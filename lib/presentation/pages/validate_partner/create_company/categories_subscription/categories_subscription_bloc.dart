import 'package:flutter/cupertino.dart';

import '../../../../../data/models/entities/category.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/entities/services_response.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/business_response.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../../data/preferences/preferences_user.dart';
import '../../../../../data/provider/provider_data.dart';

class CategoriesSubscriptionBloc with ChangeNotifier {
  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  void setError(String v) {
    ResponseModel errorM = ResponseModel();
    ResponseErrorModel errorModel = ResponseErrorModel(message: v);
    errorM.error = errorModel;
    error = errorM;
    _isLoading = false;
    notifyListeners();
    return;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //

  CompanyByTokenResponse? _company;
  CompanyByTokenResponse? get company => _company;
  //
  late CreateCompanyRequest _request;
  CreateCompanyRequest get request => _request;

  Future init(
    BuildContext context, {
    required CompanyByTokenResponse companyO,
    required CreateCompanyRequest requestO,
  }) async {
    //
    _request = requestO;
    _company = companyO;

    //
    _categories = [];
    _categoriesSelected = [];

    await getCategories();
    //
  }

//
  late List<Category> _categories;
  List<Category> get categories => _categories;

//
  late List<Category> _categoriesSelected;
  List<Category> get categoriesSelected => _categoriesSelected;

//

  Future getCategories() async {
    try {
      _isLoading = true;
      notifyListeners();
      final response = await ProviderData.listCategories();
      _isLoading = false;
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }

      _categories = response.data!;
      notifyListeners();
    } catch (e) {
      setError('Ocurrio un error, por favor contacta con tu administrador');
      return null;
    }
  }

  Future<List<ServicesResponse>> getServicesByCategories() async {
    try {
      List<EsIdRequest> request = _categoriesSelected
          .map((e) => EsIdRequest(id: e.categoryId))
          .toList();
      final response = await ProviderData.servicesByCategories(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return [];
      }

      return response.data!;

      // notifyListeners();
    } catch (e) {
      setError('Ocurrio un error, por favor contacta con tu administrador');
      return [];
    }
  }

//
  bool exists(Category item) {
    final response =
        _categoriesSelected.indexWhere((e) => e.categoryId == item.categoryId);
    if (response == -1) return false;
    return true;
  }

  onTapChip(Category item) {
    if (exists(item)) {
      _categoriesSelected.remove(item);
    } else {
      _categoriesSelected.add(item);
    }
    notifyListeners();
  }

  CreateCompanyRequest? getRequestCompany() {
    try {
      List<EsIdRequest> listCategories = _categoriesSelected
          .map((e) => EsIdRequest(id: e.categoryId))
          .toList();

      _request.categoriesIds = listCategories;

      return request;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

//

  Future<bool> register() async {
    final prefs = PreferencesUser();
    try {
      final response = await ProviderData.createCompany(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }

      final sincronization =
          await ProviderData.sincronizationToken(request.codeuid!);
      if (sincronization.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      if (!(sincronization.data!)) {
        setError('Ocurrio un error en el proceso');
        return false;
      }

      final business = response.data;
      prefs.business = BusinessResponse.businessResponseToJson(business!);

      return true;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
