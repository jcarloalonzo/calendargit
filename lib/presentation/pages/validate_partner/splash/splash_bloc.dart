import 'package:flutter/cupertino.dart';

import '../../../../data/models/entities/response_model.dart';
import '../../../../data/preferences/preferences_user.dart';

enum TypeLogin { login, home, register, token }

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
    String? user = prefs.userLoginResponse;

    print(token);
    if (token != null) {
      // Get.offNamed(DeliveryRoutes.home);
      return user != null ? TypeLogin.home : TypeLogin.login;
    } else {
      // Get.offNamed(DeliveryRoutes.login);
      return TypeLogin.token;
    }
  }
}
