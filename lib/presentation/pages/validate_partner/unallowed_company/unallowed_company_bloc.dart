import 'package:flutter/cupertino.dart';

import '../../../../../data/models/entities/response_model.dart';

class UnallowedCompanyBloc with ChangeNotifier {
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

  Future init(BuildContext context) async {
    //

    //
  }
//
//
//
}
