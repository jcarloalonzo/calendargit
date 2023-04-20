// // ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

// import 'package:flutter/cupertino.dart';

// import '../../../data/models/entities/response_model.dart';

// class LicenseSpaBloc with ChangeNotifier {
// //

//   ResponseModel? _error;
//   ResponseModel? get error => _error;
//   set error(ResponseModel? value) {
//     _error = value;
//     notifyListeners();
//   }

//   void setError(String v) {
//     ResponseModel errorM = ResponseModel();
//     ResponseErrorModel errorModel = ResponseErrorModel(message: v);
//     errorM.error = errorModel;
//     _isLoading = false;
//     error = errorM;
//     notifyListeners();
//     return;
//   }

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   //

//   //
//   //
//   //
//   //
//   //

//   init() async {
//     notifyListeners();

//     notifyListeners();

//     notifyListeners();
//   }

//   void dipose() {
//     notifyListeners();
//   }
// }
