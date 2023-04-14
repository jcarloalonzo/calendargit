import 'package:flutter/cupertino.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/requests/login_request.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../../data/provider/provider_data.dart';

class LoginBloc with ChangeNotifier {
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
  }

//
//
//
//
//
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }

  //
  //
  bool validador() {
    final user = userController.text;
    final password = passwordController.text;

    if (MyUtils.stringIsnullOrEmpty(user)) {
      setError('Debe ingresar un usuario');
      return false;
    }
    if (MyUtils.stringIsnullOrEmpty(password)) {
      setError('Debe ingresar una contraseña');
      return false;
    }

    return true;
  }

  Future<LoginResponse?> login(int businessID) async {
    try {
      final user = userController.text;
      final password = passwordController.text;
      bool valida = validador();
      if (!valida) return null;
      LoginRequest request = LoginRequest(
        businessId: businessID,
        emailAddress: user,
        passToken: password,
      );
      final response = await ProviderData.login(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }
}
