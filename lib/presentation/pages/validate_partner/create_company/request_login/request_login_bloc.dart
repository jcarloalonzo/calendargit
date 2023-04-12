import 'package:flutter/cupertino.dart';

import '../../../../../core/config/Utils.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/business_response.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../../data/preferences/preferences_user.dart';
import '../../../../../data/provider/provider_data.dart';

class RequestLoginBloc with ChangeNotifier {
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
    notifyListeners();
    return;
  }

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  //
  bool _isHidden = true;
  bool get isHidden => _isHidden;
  set isHidden(bool v) {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  CompanyByTokenResponse? _company;
  CompanyByTokenResponse? get company => _company;
  CreateCompanyRequest? _request;
  CreateCompanyRequest? get request => _request;

  Future init(
    BuildContext context, {
    required CompanyByTokenResponse companyO,
    required CreateCompanyRequest requestO,
  }) async {
    //
    _request = requestO;
    _company = companyO;

    userController.text = '';
    passwordController.text = '';
    //
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//
//
//
//

  CompanyByTokenResponse? _companySearched;

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }

  CreateCompanyRequest? getRequestCompany() {
    try {
      String user = userController.text;
      String password = passwordController.text;

      if (MyUtils.stringIsnullOrEmpty(user)) {
        setError('Debe ingresar un nombre de usuario');
        return null;
      }
      if (MyUtils.stringIsnullOrEmpty(password)) {
        setError('Debe ingresar una contraseña ');
        return null;
      }
      _request?.userLogin = user;
      _request?.userPassToken = password;

      return request;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  Future<bool> register() async {
    final prefs = PreferencesUser();
    try {
      String user = userController.text;
      String password = passwordController.text;

      if (MyUtils.stringIsnullOrEmpty(user)) {
        setError('Debe ingresar un nombre de usuario');
        return false;
      }
      if (MyUtils.stringIsnullOrEmpty(password)) {
        setError('Debe ingresar una contraseña ');
        return false;
      }
      _request?.userLogin = user;
      _request?.userPassToken = password;

      final response = await ProviderData.createCompany(request!);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }

      final sincronization =
          await ProviderData.sincronizationToken(request!.codeuid!);
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
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
