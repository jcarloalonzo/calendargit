import 'package:calendario/core/config/Utils.dart';
import 'package:calendario/data/preferences/preferences_user.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/models/entities/response_model.dart';

class RegisterBloc with ChangeNotifier {
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
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//
//
//
//
  TextEditingController tokenController = TextEditingController();

  Future validar() async {
    final _token = tokenController.text;

    if (MyUtils.stringIsnullOrEmpty(_token)) {
      // throw 'error';
      setError('Debe ingresar el token en el campo de texto');
      return;
    }
    //
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {});

    registrarToken(_token);

    _isLoading = false;
    notifyListeners();
  }

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }
}