import 'package:flutter/cupertino.dart';

import '../../core/config/Utils.dart';
import '../../data/models/entities/anula_booking_request.dart';
import '../../data/models/entities/booking.dart';
import '../../data/models/entities/complete_booking_request.dart';
import '../../data/models/entities/dropdown_model.dart';
import '../../data/models/entities/login_model.dart';
import '../../data/models/entities/program_turn_model.dart';
import '../../data/models/entities/reprogram_request.dart';
import '../../data/models/entities/response_model.dart';
import '../../data/models/entities/services_hours_model.dart';
import '../../data/models/requests/booking_request.dart';
import '../../data/models/requests/generate_invoice_booking_request.dart';
import '../../data/models/responses/to_invoice_response.dart';
import '../../data/providers/booking_provider.dart';
import '../widgets/my_loading_super.dart';

class ScheduleBloc extends ChangeNotifier {
  Booking? _bookingSeleccionado;
  Booking? get bookingSeleccionado {
    return _bookingSeleccionado;
  }

  set bookingSeleccionado(Booking? obj) {
    _bookingSeleccionado = obj;
    notifyListeners();
  }

  List<ProgamTurnModel>? _listProgramTurnModel = [];

  List<ProgamTurnModel> get lisProgramTurnModel {
    return _listProgramTurnModel!;
  }
  //

  ProgamTurnModel? _programTurnSelected;
  ProgamTurnModel? get programTurnSelected {
    return _programTurnSelected;
  }

  set programTurnSelected(ProgamTurnModel? obj) {
    _programTurnSelected = obj;
    notifyListeners();
  }

  TipoCancelacionDrop _tipoCancelacionSelected = tiposCancelacionesDrop[0];
  TipoCancelacionDrop get tipoCancelacionSelected => _tipoCancelacionSelected;
  set tipoCancelacionSelected(TipoCancelacionDrop obj) {
    _tipoCancelacionSelected = obj;
    notifyListeners();
  }

//

  int? _serviceID = 0;
  set setServiceID(int? v) {
    _serviceID = v;
    notifyListeners();
  }
//

  LoginResponse? _dataLogin;
  LoginResponse? get dataLogin => _dataLogin;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingBookings = false;
  bool get isLoadingBookings => _isLoadingBookings;

  List<Booking> _listBooking = [];
  List<Booking> get listBooking => _listBooking;

  String? _fechaSelected;

  String? get fechaSelected => _fechaSelected;

  set fechaSelected(String? v) {
    _fechaSelected = v;
    notifyListeners();
  }

  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  Future<void> _setError(ResponseModel error) async {
    _isLoading = false;
    _isLoadingBookings = false;
    _isLoadingPageRepro = false;
    _error = error;
    notifyListeners();
  }

//
//

  ResponseModel? _errorRepro;
  ResponseModel? get errorRepro => _errorRepro;
  set errorRepro(ResponseModel? value) {
    _errorRepro = value;
    notifyListeners();
  }

  Future<void> _setErrorRepro(ResponseModel errorRepro) async {
    _isLoadingBookings = false;
    _isLoadingTurn = false;
    _isLoadingPageRepro = false;
    _isLoading = false;
    _errorRepro = errorRepro;
    notifyListeners();
  }

  //
  PersonRangeDateModel? _rangeDatePerson;

  PersonRangeDateModel? get rangeDatePerson {
    return _rangeDatePerson;
  }
  //
  //

  // CAPTURAR

  String? calculaDayString() {
    if (_fechaSelected != null) {
      int v = MyUtils.calculateDifference(_fechaSelected!);

      switch (v) {
        case -1:
          return 'Ayer';
        case 0:
          return 'Hoy';
        case 1:
          return 'Mañana';
        default:
      }
      return null;
    }
    return null;
  }

  initPage({LoginResponse? login}) async {
    if (_dataLogin == null) {
      if (login != null) {
        _dataLogin = login;
      }
    }
    _isLoading = true;
    _fechaSelected = MyUtils.formatDate(DateTime.now());
    await getBookings();
    notifyListeners();
  }

  Future<void> getBookings({int? bookingState = 1}) async {
    _isLoading = true;
    _listBooking = [];
    notifyListeners();

    try {
      GetBookingListRequest obj = GetBookingListRequest();
      obj.businessID = _dataLogin?.userBusinessDto[0].businessId;
      obj.personID = _dataLogin?.personId;
      obj.initialDate = _fechaSelected;
      obj.finalDate = _fechaSelected;
      obj.bookingStateID = bookingState;
      notifyListeners();
      final response = await APIBooking.getBookingList(obj: obj);
      // response.statusCode = 300;
      // response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listBooking = response.data!;
      }
      await _setError(response);
      return;
    } catch (e) {
      await _tryCatchError(e);
    }
  }

  Future<void> getBookingsPickDate({int? bookingState = 1}) async {
    _isLoadingBookings = true;
    _listBooking = [];
    notifyListeners();
    try {
      GetBookingListRequest obj = GetBookingListRequest();
      obj.businessID = _dataLogin?.userBusinessDto[0].businessId;
      obj.personID = _dataLogin?.personId;
      obj.initialDate = _fechaSelected;
      obj.finalDate = _fechaSelected;
      obj.bookingStateID = bookingState;
      notifyListeners();
      final response = await APIBooking.getBookingList(obj: obj);
      // response.statusCode = 300;
      // response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listBooking = response.data!;
      }
      // if (response != null) {
      //   _listBooking = response.data!;
      //   _isLoading = false;
      //   notifyListeners();
      //   return true;
      // }
      await _setError(response);
      return;
    } catch (e) {
      await _tryCatchError(e);
    }
  }
  //
  //
  //
  //
  //
  //
  //
  //

  bool _isLoadingTurn = false;

  bool get isLoadingTurn {
    return _isLoadingTurn;
  }

  bool _isLoadingPageRepro = false;

  bool get isLoadingPageRepro {
    return _isLoadingPageRepro;
  }

//
  //
  String? _dateSelectedTurn;

  String? get dateSelectedTurn => _dateSelectedTurn;

  set dateSelectedTurn(String? v) {
    _dateSelectedTurn = v;
    notifyListeners();
  }

  Future<void> getRandeDatePerson() async {
    _rangeDatePerson = null;
    _isLoading = true;
    _isLoadingPageRepro = true;
    notifyListeners();
    try {
      final response =
          await APIBooking.personGetRangeDate(_dataLogin!.personId);
      // _response.statusCode = 300;
      // _response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _rangeDatePerson = response.data;
      }
      await _setErrorRepro(response);
    } catch (e) {
      await _tryCatchErrorRepro(e);
    }
  }

  Future<void> getProgramTurn(
      {required String date, bool isInit = true}) async {
    // TOMAMOS DATE
    _dateSelectedTurn = date;
    // TOMAMOS DATE
    _isLoadingTurn = true;
    if (isInit) {
      _isLoadingPageRepro = true;
    }
    _listProgramTurnModel = [];
    _programTurnSelected = null;
    notifyListeners();
    try {
      GetTurnRequest obj = GetTurnRequest();
      obj.serviceID = _serviceID!;
      obj.personID = _dataLogin!.personId;
      obj.dateProgram = _dateSelectedTurn;

      final response = await APIBooking.programGetTurn(obj: obj);
      // _response.statusCode = 300;
      // _response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode == 200) {
        _listProgramTurnModel = response.data;
      }
      await _setErrorRepro(response);
      return;
    } catch (e) {
      await _tryCatchErrorRepro(e);
    }
  }

  Future<void> _tryCatchError(Object e) async {
    var x = ResponseModel();
    x.statusCode = 300;
    x.error = ResponseErrorModel(code: 500, message: e.toString());
    await _setError(x);
    return;
  }

  Future<void> _tryCatchErrorRepro(Object e) async {
    var x = ResponseModel();
    x.statusCode = 300;
    x.error = ResponseErrorModel(code: 500, message: e.toString());
    await _setErrorRepro(x);
    return;
  }

  Future<bool> validaReprogram(
      {required int bookingID, BuildContext? ctx}) async {
    // _charge = true;

    notifyListeners();

    try {
      final myLoading = MyLoading(ctx!);
      myLoading.createLoading();

      final response =
          await APIBooking.validateToReprogram(bookingID: bookingID);
      myLoading.dismiss();

      _isLoading = false;
      // _response.statusCode = 300;
      // _response.error = ResponseErrorModel(code: 500, message: 'prueba');
      if (response.statusCode != 200) {
        await _setError(response);
        return false;
      }
      // _servicelist = _response.data!;
      notifyListeners();
      return true;
    } catch (e) {
      await _tryCatchError(e);
      return false;
    }
  }

  TipoPagoModelDropDown? _tipoPagoModelDropSelected = tipoPagoModels[0];

  set tipoPagoSelected(TipoPagoModelDropDown obj) {
    _tipoPagoModelDropSelected = obj;
    notifyListeners();
  }

  TipoPagoModelDropDown get tipoPagoSelected {
    return _tipoPagoModelDropSelected!;
  }

  TipoTarjetaModelDropDown? _tipoTarjetaDropSelected = tipoTarjetaModels[0];

  set tipoTarjetaSelected(TipoTarjetaModelDropDown obj) {
    _tipoTarjetaDropSelected = obj;
    notifyListeners();
  }

  TipoTarjetaModelDropDown get tipoTarjetaSelected {
    return _tipoTarjetaDropSelected!;
  }

  bool _imprimeInvoice = true;

  bool? get imprimeInvoice => _imprimeInvoice;
  set imprimeInvoice(bool? value) {
    _imprimeInvoice = value!;
    notifyListeners();
  }

  Future<ResponseModel<bool>> reprogramBookingService(
      LoginResponse loginModel) async {
    ReprogramRequest objRQ = ReprogramRequest();

    objRQ.bookingId = _bookingSeleccionado?.bookingId;

    objRQ.user = _dataLogin?.userId;

    objRQ.businessId = loginModel.userBusinessDto[0].businessId;
    objRQ.businessIdent = loginModel.userBusinessDto[0].identification;

    objRQ.date = _dateSelectedTurn;

    objRQ.initialTime = _programTurnSelected?.initialTurn;
    objRQ.finalTime = _programTurnSelected?.finalTurn;

    // var response = await confirmBooking(objRQ, _bookingId!);

    // final _response = await APIServices.reprogramBooking(obj: objRQ);

    var response = await reprograBooking(objRQ);

    if (response.statusCode != 200) {
      notifyListeners();
    }
    return response;
  }

  Future<ResponseModel<bool>> reprograBooking(
      ReprogramRequest objRequest) async {
    final rspta = await APIBooking.reprogramBooking(obj: objRequest);
    _error = rspta;
    return rspta;
  }

  Future<ResponseModel<bool>> completeBooking(
      // {required String comentario, required String priceFinal}) async {
      ) async {
    CompleteBookingRequest obj = CompleteBookingRequest();

    obj.bookingId = _bookingSeleccionado?.bookingId;
    obj.authorizedUser = 0;
    obj.businessId = _dataLogin?.userBusinessDto[0].businessId;
    obj.businessIdent = _dataLogin?.userBusinessDto[0].identification;
    obj.officeId = _dataLogin?.userBusinessDto[0].officeId;
    // obj.completed = true;

    // obj.invoice = false;
    // obj.priceFinal = num.parse(priceFinal);
    // obj.comment = comentario;
    // obj.telephone = _bookingSeleccionado?.phoneNumber;
    // obj.emailAddress = _bookingSeleccionado?.emailAddress;

    final response = await APIBooking.completeBookingAPI(obj: obj);
    // var response = await completeBooking(obj);
    _setErrorRepro(response);
    if (response.statusCode != 200) {
      notifyListeners();
    }
    return response;
  }

  //
  //
  //

  Future<ResponseModel<bool>> anularBooking({required String reason}) async {
    AnulaBookingRequest obj = AnulaBookingRequest();

    obj.bookingId = _bookingSeleccionado?.bookingId;
    obj.user = _dataLogin?.userId;
    obj.businessId = _dataLogin?.userBusinessDto[0].businessId;
    obj.businessIdent = _dataLogin?.userBusinessDto[0].identification;
    obj.reason = reason;

    // var response = await anulaBooking(obj);
    final response = await APIBooking.anulaBooking(obj: obj);
    // _response.statusCode = 300;
    // _response.error = ResponseErrorModel(code: 500, message: 'prueba');
    _setErrorRepro(response);
    // _error = _response;
    if (response.statusCode != 200) {
      notifyListeners();
    }
    return response;
  }

//
  void initProgram({required Booking bookingObj}) {
    _bookingSeleccionado = bookingObj;
    //

    //
    _listProgramTurnModel = [];
    _programTurnSelected = null;
    _serviceID = 0;
    _isLoadingTurn = false;

    _isLoading = false;
    _rangeDatePerson = null;
    _error = null;
    notifyListeners();
  }

  //
  //
  TypeStateBookingDropDown _typeStateBookingDropDown = typeStatesDropDown[0];
  TypeStateBookingDropDown get typeStateBookingDropDown =>
      _typeStateBookingDropDown;
  set typeStateBookingDropDown(TypeStateBookingDropDown obj) {
    _typeStateBookingDropDown = obj;
    notifyListeners();
  }

  //
  void initFilter() {
    _typeStateBookingDropDown = typeStatesDropDown[0];
    notifyListeners();
  }

  void initCancelFilter() {
    _tipoCancelacionSelected = tiposCancelacionesDrop[0];
    notifyListeners();
  }

  num? _descuentoInvoice = 0;
  num? get descuentoInvoice => _descuentoInvoice;

  void setDescuentoInvoice({num? v = 0}) {
    if (v != null) {
      _descuentoInvoice = v;

      // _totalFinal = _total - _descuento;

      notifyListeners();
      // _cantidad = v;
    }
  }

  num? _pagoInvoice = 0;
  num? get pagoInvoice => _pagoInvoice;

  void setPagoInvoice({num? v = 0}) {
    if (v != null) {
      _pagoInvoice = v;

      // _totalFinal = _total - _descuento;

      notifyListeners();
      // _cantidad = v;
    }
  }

  num getTotalInvoice() {
    return _bookingSeleccionado!.price! - _descuentoInvoice!;
  }

  num getVueltoInvoice() {
    num u = getTotalInvoice() - _pagoInvoice!;

    return u;
  }

  String? _numeroTarjeta = '';
  String? get numeroTarjeta => _numeroTarjeta;
  void setNumeroTarjeta(String? v) {
    _numeroTarjeta = v;
    notifyListeners();
  }

  Future<ResponseModel<ToInvoiceResponse>> generateInvoiceBooking() async {
    // _charge = true;

    notifyListeners();

    // final myLoading = MyLoading( ctx!);
    // myLoading.createLoading();

    GenerateInvoiceBookingRequest obj = GenerateInvoiceBookingRequest();
    obj.user = _dataLogin!.userId;
    obj.businessId = _dataLogin!.userBusinessDto[0].businessId;
    obj.businessIdent = _dataLogin!.userBusinessDto[0].identification;
    obj.officeId = _dataLogin!.userBusinessDto[0].officeId;
    obj.subAmount = _bookingSeleccionado?.price;
    obj.taxPorc = 0;
    obj.taxAmount = 0;
    obj.taxPorc1 = 0;
    obj.taxAmount1 = 0;
    obj.dscto = _descuentoInvoice;
    obj.amount = getTotalInvoice();
    obj.listPayment = <ListPaymentRequest>[
      ListPaymentRequest(
        typePayment: _tipoPagoModelDropSelected?.cod.toString(),
        numberCard: _numeroTarjeta,
        numerOperation: '',
        amount: _pagoInvoice,
      ),
    ];

    final response = await APIBooking.generateInvoice(
        bookingID: _bookingSeleccionado!.bookingId!, obj: obj);

    // myLoading.dismiss();

    _isLoading = false;
    // _response.statusCode = 300;
    // _response.error = ResponseErrorModel(code: 500, message: 'prueba');

    _setErrorRepro(response);

    if (response.statusCode != 200) {
      // return null;
    }
    // _servicelist = _response.data!;
    notifyListeners();
    return response;
  }

//
  @override
  dispose() {
    _listBooking = [];
    _isLoading = false;
    notifyListeners();
    // TODO: implement dispose
  }
}
