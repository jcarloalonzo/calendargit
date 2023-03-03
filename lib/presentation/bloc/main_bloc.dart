import 'package:flutter/cupertino.dart';

import '../../data/models/entities/login_model.dart';
import '../../data/models/entities/response_model.dart';

class MainBloc extends ChangeNotifier {
  LoginResponse? _login;
  LoginResponse? get login => _login;
  set login(LoginResponse? ob) {
    _login = ob;
    notifyListeners();
  }

  UserBusinessDto? _modelBusiness;
  UserBusinessDto? get modelBusiness => _modelBusiness;

  void init() async {
    print('init');
  }

  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  Future<void> _setError(ResponseModel error) async {
    _error = error;
    notifyListeners();
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
}
