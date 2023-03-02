import 'package:flutter/cupertino.dart';

import '../../core/config/Utils.dart';
import '../../data/models/entities/home_model.dart';
import '../../data/models/entities/login_model.dart';
import '../../data/models/entities/response_model.dart';
import '../../data/providers/booking_provider.dart';

class HomeBloc extends ChangeNotifier {
  LoginModel? _dataLogin;
  LoginModel? get dataLogin => _dataLogin;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  Future<void> _setError(ResponseModel error) async {
    _isLoading = false;
    _error = error;
    notifyListeners();
  }

  //

  List<BookingHome> _listBooking = [];
  List<BookingHome> get listBooking => _listBooking;

  //

  DateTime? _fecha = DateTime.now();
  DateTime? get fecha => _fecha;
  set fecha(DateTime? v) {
    _fecha = v;
    notifyListeners();
  }

  //

  //
  Future<void> _tryCatchError(Object e) async {
    var x = ResponseModel();
    x.statusCode = 300;
    x.error = ResponseErrorModel(code: 500, message: e.toString());
    await _setError(x);
    return;
  }

  Future<void> initPage({LoginModel? login}) async {
    if (_dataLogin == null) {
      if (login != null) {
        _dataLogin = login;
      }
    }
    _listBooking = [];
    _isLoading = true;
    notifyListeners();

    try {
      final response = await APIBooking.getBookingHome(
          businessID: _dataLogin!.userBusinessDto![0].businessId!,
          personID: _dataLogin!.personId!,
          date: MyUtils.formatDate(DateTime.now()));
      // _response.statusCode = 300;
      // _response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listBooking = response.data!;
      }
      await _setError(response);
    } catch (e) {
      _tryCatchError(e);
    }
  }
}
