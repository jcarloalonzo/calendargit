import 'package:flutter/cupertino.dart';

import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/validate_token_response.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../../data/provider/provider_data.dart';

enum TypeLogin { login, home, register, token, error }

class SplashBloc with ChangeNotifier {
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
  final bool _isVisible = false;
  bool get isVisible => _isVisible;

  Future init(
    BuildContext context,
  ) async {
    //
    //
    //
  }

  //
  //
  //
  //

  //
  //

  Future<TypeLogin> validateSession() async {
    final prefs = PreferencesUser();
    String? token = prefs.token;
    String? user = prefs.user;
    if (token == null) return TypeLogin.token;
    ValidateTokenResponse? validatetoken = await validateToken(token);
    if (validatetoken == null) return TypeLogin.error;
    if (!(validatetoken.isRegister!)) return TypeLogin.register;
    BusinessResponse? business = await businessByToken(token);
    if (business == null) return TypeLogin.error;
    if (user == null) return TypeLogin.login;
    return TypeLogin.home;
  }

  Future<ValidateTokenResponse?> validateToken(String token) async {
    try {
      final response = await ProviderData.validateToken(token);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }

      return response.data;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  Future<BusinessResponse?> businessByToken(String token) async {
    final prefs = PreferencesUser();
    try {
      if (prefs.business != null) {
        BusinessResponse? business =
            BusinessResponse.businessResponseFromJson(prefs.business!);

        return business;
      }

      final response = await ProviderData.businessByToken(token);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }

      final businessResp = response.data;
      prefs.business = BusinessResponse.businessResponseToJson(businessResp!);
      return businessResp;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }
}
