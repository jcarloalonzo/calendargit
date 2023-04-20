import 'package:flutter/foundation.dart';

import '../../data/models/entities/response_model.dart';

class StateNotifier extends ChangeNotifier {
  bool _mounted = true;
  bool get mounted => _mounted;
  //
  //

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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
    _isLoading = false;
    error = errorM;
    notifyListeners();
    return;
  }

  //
  //

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
