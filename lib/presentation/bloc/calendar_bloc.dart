import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../core/config/Utils.dart';
import '../../core/config/config.dart';
import '../../data/models/entities/booking.dart';
import '../../data/models/entities/dropdown_model.dart';
import '../../data/models/entities/login_model.dart';
import '../../data/models/entities/response_model.dart';
import '../../data/models/requests/booking_request.dart';
import '../../data/providers/booking_provider.dart';

class CalendarBloc extends ChangeNotifier {
  // bool _charge = false;
  // bool get charge => _charge;

  // List<BookingAgentModel> _servicelist = [];
  // List<BookingAgentModel> get servicelist => _servicelist;

  // Typehorario _typeHorario = Typehorario.semana;
  // Typehorario get typeHorario => _typeHorario;

  // int _businessID = 0;
  // int _personID = 0;

  // int www() {
  //   return _personID;
  // }

  // Future<void> changeType({required Typehorario type}) async {
  //   _charge = true;
  //   notifyListeners();
  //   String initialDate = '';
  //   String finalDate = '';
  //   _typeHorario = type;
  //   switch (type) {
  //     case Typehorario.ayer:
  //       initialDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
  //       break;
  //     case Typehorario.hoy:
  //       initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
  //       break;
  //     case Typehorario.semana:
  //       initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');

  //       finalDate = Config.formatDate(
  //           DateTime.now()
  //               .add(Duration(days: 1 * (7 - DateTime.now().weekday))),
  //           'yyyy-MM-dd');

  //       break;
  //     case Typehorario.manana:
  //       initialDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');

  //       break;
  //     case Typehorario.mes:
  //       initialDate = Config.formatDate(
  //           DateTime(DateTime.now().year, DateTime.now().month, 1),
  //           'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime(
  //               DateTime.now().month == 12
  //                   ? DateTime.now().year + 1
  //                   : DateTime.now().year,
  //               DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
  //               0),
  //           'yyyy-MM-dd');

  //       break;
  //     default:
  //   }

  //   final _api = APIServices();
  //   final _response = await _api.getBookingList(
  //       businessID: _businessID,
  //       personID: _personID,
  //       initialDate: initialDate,
  //       finalDate: finalDate,
  //       bookingStateID: 0);

  //   if (_response.statusCode != 200) {
  //     await _setError(_response);
  //     return;
  //   }
  //   _servicelist = _response.data!;

  //   _charge = false;
  //   notifyListeners();
  // }

  //
  //
  TypeStateBookingDropDown _typeStateBookingDropDown = typeStatesDropDown[0];
  TypeStateBookingDropDown get typeStateBookingDropDown =>
      _typeStateBookingDropDown;
  set typeStateBookingDropDown(TypeStateBookingDropDown obj) {
    _typeStateBookingDropDown = obj;
    notifyListeners();
  }

  void initFilter() {
    _typeStateBookingDropDown = typeStatesDropDown[0];
    notifyListeners();
  }

  LoginResponse? _dataLogin;
  LoginResponse? get dataLogin => _dataLogin;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Booking> _listBooking = [];
  List<Booking> get listBooking => _listBooking;

  Future<void> _tryCatchError(Object e) async {
    var x = ResponseModel();
    x.statusCode = 300;
    x.error = ResponseErrorModel(code: 500, message: e.toString());
    await _setError(x);
    return;
  }

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

  initPage({LoginResponse? login, required BuildContext context}) async {
    if (_dataLogin == null) {
      if (login != null) {
        _dataLogin = login;
      }
    }
    _isLoading = true;
    // _fechaSelected = MyUtilsformatDate(DateTime.now());

    await getBookings(context: context);
    notifyListeners();
  }

  Future<void> getBookings(
      {int? bookingState = 1, required BuildContext context}) async {
    _isLoading = true;
    _listBooking = [];

    await cleanCalendar(context);

    notifyListeners();

    try {
      String initialDate = Config.formatDate(
          DateTime(DateTime.now().year, DateTime.now().month, 1), 'yyyy-MM-dd');
      String finalDate = Config.formatDate(
          DateTime(
              DateTime.now().month == 12
                  ? DateTime.now().year + 1
                  : DateTime.now().year,
              DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
              0),
          'yyyy-MM-dd');

      GetBookingListRequest obj = GetBookingListRequest();
      obj.businessID = _dataLogin?.userBusinessDto?[0].businessId;
      obj.personID = _dataLogin?.personId;
      obj.initialDate = initialDate;
      obj.finalDate = finalDate;
      obj.bookingStateID = bookingState;
      notifyListeners();
      final response = await APIBooking.getBookingList(obj: obj);
      // response.statusCode = 300;
      // response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listBooking = response.data!;

        for (var i = 0; i < listBooking.length; i++) {
          CalendarEventData<Booking> evnt = CalendarEventData<Booking>(
              date: listBooking[i].date!,
              startTime: DateTime.parse(
                  '${MyUtils.formatDate(listBooking[i].date!)} ${listBooking[i].initialTime}:01'),
              endTime: DateTime.parse(
                      '${MyUtils.formatDate(listBooking[i].date!)} ${listBooking[i].finalTime}')
                  .add(const Duration(milliseconds: -1)),
              event: listBooking[i],
              title: listBooking[i].serviceDescription!);

          CalendarControllerProvider.of<Booking>(context).controller.add(evnt);
        }
      }
      await _setError(response);
      return;
    } catch (e) {
      await _tryCatchError(e);
    }
  }

  Future<void>? cleanCalendar(BuildContext c) async {
    try {
      var controller = CalendarControllerProvider.of<Booking>(c).controller;
      List<CalendarEventData<Booking>> list = controller.events;
      // print(controller.events);
      for (var ev in list) {
        controller.remove(ev);
      }
      return;
    } catch (e) {
      await _tryCatchError(e);
      return;
    }
  }

//
//

  // Future<void> init(
  //     {required int businessID,
  //     required int personID,
  //     required Typehorario type}) async {
  //   _charge = true;
  //   _businessID = businessID;
  //   _personID = personID;

  //   notifyListeners();

  //   String initialDate = '';
  //   String finalDate = '';

  //   switch (type) {
  //     case Typehorario.ayer:
  //       initialDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
  //       break;
  //     case Typehorario.hoy:
  //       initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
  //       break;
  //     case Typehorario.semana:
  //       initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime.now()
  //               .add(Duration(days: 1 * (7 - DateTime.now().weekday))),
  //           'yyyy-MM-dd');
  //       break;
  //     case Typehorario.manana:
  //       initialDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
  //       break;
  //     case Typehorario.mes:
  //       initialDate = Config.formatDate(
  //           DateTime(DateTime.now().year, DateTime.now().month, 1),
  //           'yyyy-MM-dd');
  //       finalDate = Config.formatDate(
  //           DateTime(
  //               DateTime.now().month == 12
  //                   ? DateTime.now().year + 1
  //                   : DateTime.now().year,
  //               DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
  //               0),
  //           'yyyy-MM-dd');
  //       break;
  //     default:
  //   }

  //   final _api = APIServices();
  //   final _response = await _api.getBookingList(
  //       businessID: businessID,
  //       personID: personID,
  //       initialDate: initialDate,
  //       finalDate: finalDate,
  //       bookingStateID: 0);

  //   if (_response.statusCode != 200) {
  //     await _setError(_response);
  //     return;
  //   }
  //   _servicelist = _response.data!;

  //   _charge = false;
  //   notifyListeners();
  // }

  // Future<void> initSchedule(
  //     {required int businessID,
  //     required int personID,
  //     required Typehorario type}) async {
  //   _charge = true;
  //   _businessID = businessID;
  //   _personID = personID;

  //   notifyListeners();

  //   String initialDate = '2022-03-26';
  //   String finalDate = '2022-03-26';

  //   final _api = APIServices();
  //   final _response = await _api.getBookingList(
  //       businessID: businessID,
  //       personID: personID,
  //       initialDate: initialDate,
  //       finalDate: finalDate,
  //       bookingStateID: 0);

  //   if (_response.statusCode != 200) {
  //     await _setError(_response);
  //     return;
  //   }
  //   _servicelist = _response.data!;

  //   _charge = false;

  //   notifyListeners();
  // }

  // Future<bool> validaReprogram({required int bookingID}) async {
  //   // _charge = true;
  //   notifyListeners();

  //   final _api = APIServices();
  //   final _response = await _api.validateToReprogram(bookingID: bookingID);
  //   _charge = false;

  //   if (_response.statusCode != 200) {
  //     await _setError(_response);
  //     return false;
  //   }
  //   // _servicelist = _response.data!;
  //   notifyListeners();
  //   return true;
  // }
}
