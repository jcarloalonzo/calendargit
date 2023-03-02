import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../core/config/config.dart';
import '../../data/models/entities/booking.dart';
import '../../data/models/entities/response_model.dart';
import '../../data/services/api_services.dart';

enum Typehorario { ayer, hoy, manana, semana, mes }

class AgentModelProvider extends ChangeNotifier {
  bool _charge = false;
  bool get charge => _charge;

  List<Booking> _servicelist = [];
  List<Booking> get servicelist => _servicelist;

  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  Future<void> _setError(ResponseModel error) async {
    _charge = false;
    _error = error;
    notifyListeners();
  }

  Typehorario _typeHorario = Typehorario.semana;
  Typehorario get typeHorario => _typeHorario;

  int _businessID = 0;
  int _personID = 0;

  int www() {
    return _personID;
  }

  Future<void>? cleanCalendar(BuildContext c) {
    try {
      var controller = CalendarControllerProvider.of<Booking>(c).controller;
      List<CalendarEventData<Booking>> list = controller.events;
      for (var ev in list) {
        controller.remove(ev);
      }
      return null;
    } catch (e) {}
    return null;
  }

  Future<void> changeType({required Typehorario type}) async {
    _charge = true;
    notifyListeners();
    String initialDate = '';
    String finalDate = '';
    _typeHorario = type;
    switch (type) {
      case Typehorario.ayer:
        initialDate = Config.formatDate(
            DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
        break;
      case Typehorario.hoy:
        initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
        finalDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
        break;
      case Typehorario.semana:
        initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');

        finalDate = Config.formatDate(
            DateTime.now()
                .add(Duration(days: 1 * (7 - DateTime.now().weekday))),
            'yyyy-MM-dd');

        break;
      case Typehorario.manana:
        initialDate = Config.formatDate(
            DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');

        break;
      case Typehorario.mes:
        initialDate = Config.formatDate(
            DateTime(DateTime.now().year, DateTime.now().month, 1),
            'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime(
                DateTime.now().month == 12
                    ? DateTime.now().year + 1
                    : DateTime.now().year,
                DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
                0),
            'yyyy-MM-dd');

        break;
      default:
    }

    final api = APIServices();
    final response = await api.getBookingList(
        businessID: _businessID,
        personID: _personID,
        initialDate: initialDate,
        finalDate: finalDate,
        bookingStateID: 0);

    if (response.statusCode != 200) {
      await _setError(response);
      return;
    }
    _servicelist = response.data!;

    _charge = false;
    notifyListeners();
  }

  Future<void> init(
      {required int businessID,
      required int personID,
      required Typehorario type}) async {
    _charge = true;
    _businessID = businessID;
    _personID = personID;

    notifyListeners();

    String initialDate = '';
    String finalDate = '';

    switch (type) {
      case Typehorario.ayer:
        initialDate = Config.formatDate(
            DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime.now().add(const Duration(days: -1)), 'yyyy-MM-dd');
        break;
      case Typehorario.hoy:
        initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
        finalDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
        break;
      case Typehorario.semana:
        initialDate = Config.formatDate(DateTime.now(), 'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime.now()
                .add(Duration(days: 1 * (7 - DateTime.now().weekday))),
            'yyyy-MM-dd');
        break;
      case Typehorario.manana:
        initialDate = Config.formatDate(
            DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime.now().add(const Duration(days: 1)), 'yyyy-MM-dd');
        break;
      case Typehorario.mes:
        initialDate = Config.formatDate(
            DateTime(DateTime.now().year, DateTime.now().month, 1),
            'yyyy-MM-dd');
        finalDate = Config.formatDate(
            DateTime(
                DateTime.now().month == 12
                    ? DateTime.now().year + 1
                    : DateTime.now().year,
                DateTime.now().month == 12 ? 1 : DateTime.now().month + 1,
                0),
            'yyyy-MM-dd');
        break;
      default:
    }

    final api = APIServices();
    final response = await api.getBookingList(
        businessID: businessID,
        personID: personID,
        initialDate: initialDate,
        finalDate: finalDate,
        bookingStateID: 0);

    if (response.statusCode != 200) {
      await _setError(response);
      return;
    }
    _servicelist = response.data!;

    _charge = false;
    notifyListeners();
  }

  Future<void> initSchedule(
      {required int businessID,
      required int personID,
      required Typehorario type}) async {
    _charge = true;
    _businessID = businessID;
    _personID = personID;

    notifyListeners();

    String initialDate = '2022-03-26';
    String finalDate = '2022-03-26';

    final api = APIServices();
    final response = await api.getBookingList(
        businessID: businessID,
        personID: personID,
        initialDate: initialDate,
        finalDate: finalDate,
        bookingStateID: 0);

    if (response.statusCode != 200) {
      await _setError(response);
      return;
    }
    _servicelist = response.data!;

    _charge = false;

    notifyListeners();
  }

  Future<bool> validaReprogram({required int bookingID}) async {
    // _charge = true;
    notifyListeners();

    final api = APIServices();
    final response = await api.validateToReprogram(bookingID: bookingID);
    _charge = false;

    if (response.statusCode != 200) {
      await _setError(response);
      return false;
    }
    // _servicelist = _response.data!;
    notifyListeners();
    return true;
  }
}
