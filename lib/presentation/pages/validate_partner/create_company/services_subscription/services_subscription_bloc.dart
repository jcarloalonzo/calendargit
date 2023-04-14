import 'package:flutter/cupertino.dart';

import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/entities/services_response.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/business_response.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../../data/preferences/preferences_user.dart';
import '../../../../../data/provider/provider_data.dart';

class ServicesSubscriptionBloc with ChangeNotifier {
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

  late CreateCompanyRequest _request;
  CreateCompanyRequest get request => _request;

  late List<ServicesResponse> _services;
  List<ServicesResponse> get services => _services;
  late List<ServicesResponse> _servicesSelected;
  List<ServicesResponse> get servicesSelected => _servicesSelected;
  Future init(
    BuildContext context, {
    required CompanyByTokenResponse companyO,
    required CreateCompanyRequest requestO,
    required List<ServicesResponse> servicesOb,
  }) async {
    //
    _services = servicesOb;
    _servicesSelected = [];
    _request = requestO;
    _company = companyO;

    //
    notifyListeners();
    //
  }

//

//

  bool exists(ServicesResponse item) {
    final response =
        _servicesSelected.indexWhere((e) => e.serviceId == item.serviceId);
    if (response == -1) return false;
    return true;
  }

  onTapChip(ServicesResponse item) {
    if (exists(item)) {
      _servicesSelected.remove(item);
    } else {
      _servicesSelected.add(item);
    }
    notifyListeners();
  }

  Future<bool> register() async {
    final prefs = PreferencesUser();
    try {
      List<EsIdRequest> listServices =
          _servicesSelected.map((e) => EsIdRequest(id: e.serviceId)).toList();

      _request.servicesIds = listServices;
      print(request.toRawJson());
      // return false;
      final response = await ProviderData.createCompany(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }

      //

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
