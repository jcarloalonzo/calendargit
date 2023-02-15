import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/data/models/entities/login_model.dart';
import 'package:calendario/data/preferences/preferences_user.dart';
import 'package:calendario/data/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/models/entities/response_model.dart';

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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //
  bool _isVisible = false;
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

    if (password.length <= 7) {
      setError('La contraseña debe ser mayor a 6 caracteres');
      return false;
    }

    return true;
  }

  Future<LoginModel?> confirmLogin() async {
    try {
      final user = userController.text;
      final password = passwordController.text;
      bool valida = validador();
      if (!valida) return null;
      notifyListeners();
      final response = await APILogin.getValidateLogin(
          emailAdress: user, passToken: password!);

      notifyListeners();
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      notifyListeners();
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }
}
