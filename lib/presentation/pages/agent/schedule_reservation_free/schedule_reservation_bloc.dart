import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/client_entity.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/entities/service.dart';
import '../../../../data/models/requests/register_booking_request.dart';
import '../../../../data/models/requests/service_request.dart';
import '../../../../data/models/responses/to_register_schedule_free_response.dart';
import '../../../../data/providers/booking_provider.dart';
import '../../../../data/providers/client_provider.dart';
import '../../../../data/providers/person_provider.dart';
import '../../../../data/providers/service_provider.dart';

class ScheduleReservationBloc extends ChangeNotifier {
  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  Future<void> _setError(ResponseModel error) async {
    _isLoadingPage = false;
    _error = error;
    notifyListeners();
  }

  Future<void> _tryCatchError(Object e) async {
    var x = ResponseModel();
    x.statusCode = 300;
    x.error = ResponseErrorModel(code: 500, message: e.toString());
    await _setError(x);
    return;
  }

  bool _isLoadingPage = false;

  bool get isLoadingPage => _isLoadingPage;

  LoginModel? _dataLogin;
  LoginModel? get dataLogin => _dataLogin;

  String? _date;
  String? get date => _date;
  set date(String? v) {
    _date = v;
    notifyListeners();
  }

  //
  // String? _time;
  // String? get time => _time;
  // set time(String? v) {
  //   _time = v;
  //   notifyListeners();
  // }

  //

  List<Service> _listService = [];
  List<Service> get listService => _listService;

  List<ClientEntity> _listClient = [];
  List<ClientEntity> get listClient => _listClient;

  Service? _serviceSelected;
  Service? get serviceSelected => _serviceSelected;

  ClientEntity? _clientSelected;
  ClientEntity? get clientSelected => _clientSelected;

  set clientSelected(ClientEntity? x) {
    _clientSelected = x;
    notifyListeners();
  }

  set serviceSelected(Service? x) {
    _serviceSelected = x;
    notifyListeners();
  }

  initPage({LoginModel? login}) async {
    _serviceSelected = null;
    _listService = [];

    if (_dataLogin == null) {
      if (login != null) {
        _dataLogin = login;
      }
    }
    _date = MyUtils.formatDate(DateTime.now());
    _isLoadingPage = true;
    // _fechaSelected = MyUtilsformatDate(DateTime.now());
    await getServiceList();
    await getClients();
    notifyListeners();
  }

  Future<void> getServiceList({int? bookingState = 0}) async {
    _isLoadingPage = true;
    notifyListeners();

    try {
      final response =
          await APIPerson.getListServicePerson(personID: _dataLogin?.personId);
      // response.statusCode = 300;
      // response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listService = response.data!;
      }
      await _setError(response);
      return;
    } catch (e) {
      await _tryCatchError(e);
    }
  }

  //

  String? getHourFinal(String d) {
    if (_serviceSelected != null) {
      String fecha = MyUtils.formatDate(DateTime.parse(d));
      DateTime fecha1 = DateTime.parse('$fecha ${Jiffy(d).format('HH:mm:ss')}');
      DateTime fecha2 = DateTime.parse('$fecha ${_serviceSelected!.time}');

      DateTime horaTotal =
          fecha1.add(Duration(hours: fecha2.hour, minutes: fecha2.minute));
      return Jiffy(horaTotal).format('HH:mm:ss');
    } else {
      return null;
    }
  }

  Future<void> getClients({String? search = ''}) async {
    _isLoadingPage = true;
    notifyListeners();

    try {
      final response = await APIClient.getClient(search: search);
      // response.statusCode = 300;
      // response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listClient = response.data!;
      }
      await _setError(response);
      return;
    } catch (e) {
      await _tryCatchError(e);
    }
  }

  Future<ResponseModel<ToRegisterScheduleFreeResponse>> registerScheduleFree(
      {String? search = '', String? date}) async {
    _isLoadingPage = false;
    notifyListeners();

    RegisterBookingRequest obj = RegisterBookingRequest();
    obj.officeId = _dataLogin?.userBusinessDto?[0].officeId;
    obj.serviceId = _serviceSelected?.serviceId;
    obj.personId = _dataLogin?.personId;
    obj.clientId = _clientSelected?.clientId;
    obj.observation = '';
    obj.price = _priceService;
    obj.date = Jiffy(date).format('yyyy-MM-dd');
    obj.initialTime = Jiffy(date).format('HH:mm');
    obj.finalTime = getHourFinal(date!);
    obj.bookingStateId = 1;
    obj.onlineApp = false;
    obj.registerUser = _dataLogin?.userId;

    obj.client = ClientBookingRequest(
      documentTypeId: _clientSelected?.documentTypeId,
      identification: _clientSelected?.identification,
      name: _clientSelected?.name,
      surName: _clientSelected?.surName,
      secondSurname: _clientSelected?.secondSurName,
      sexId: _clientSelected?.sexId,
      phoneNumber: _clientSelected?.phoneNumber,
      emailAddress: _clientSelected?.emailAddress,
      userCodeUi: _clientSelected?.userCodeUi,
    );

    final response = await APIBooking.registerScheduleFree(
        obj: obj, businessID: _dataLogin!.userBusinessDto![0].businessId!);
    // response.statusCode = 300;
    // response.error = ResponseErrorModel(code: 500, message: 'prueba');
    await _setError(response);

    if (response.statusCode == 200) {
      // _listClient = response.data!;
    }
    return response;
  }

  num? _priceService;
  num? get priceService => _priceService;

  void setPriceService(num? x) {
    _priceService = x;
    notifyListeners();
  }

  //
  //
  Future<num?>? getPriceRequest({String? d}) async {
    // _isLoadingPage = true;
    notifyListeners();
    GetPriceRequest obj = GetPriceRequest();

    obj.businessID = 1;
    obj.officeID = _dataLogin?.userBusinessDto?[0].officeId;
    obj.serviceID = _serviceSelected?.serviceId;
    obj.date = Jiffy(d).format('yyyy-MM-dd');

    final response = await APIService.getPrice(obj: obj);
    // response.statusCode = 300;
    // response.error = ResponseErrorModel(code: 500, message: 'prueba');
    await _setError(response);

    if (response.statusCode == 200) {
      // _listClient = response.data!;
      return response.data;
    }
    return null;
  }

  //
  //
  @override
  dispose() {
//
  }
}
