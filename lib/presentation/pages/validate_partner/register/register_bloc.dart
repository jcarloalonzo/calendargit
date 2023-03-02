import 'package:flutter/cupertino.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../../data/preferences/preferences_user.dart';

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
  final bool _isVisible = false;
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
    final token = tokenController.text;

    if (MyUtils.stringIsnullOrEmpty(token)) {
      // throw 'error';
      setError('Debe ingresar el token en el campo de texto');
      return;
    }
    //
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {});

    registrarToken(token);

    _isLoading = false;
    notifyListeners();
  }

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }
}
