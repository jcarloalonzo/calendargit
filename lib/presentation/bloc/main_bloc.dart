import 'package:calendario/core/config/config.dart';
import 'package:calendario/data/models/entities/login_model.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/data/preferences/preferences_user.dart';
import 'package:calendario/data/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';

class MainBloc extends ChangeNotifier {
  LoginModel? _model;
  LoginModel? get model => _model;
  set model(LoginModel? ob) {
    _model = ob;
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
