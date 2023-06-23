// import 'package:flutter/cupertino.dart';

// import '../../data/models/entities/booking.dart';
// import '../../data/models/entities/program_turn_model.dart';
// import '../../data/models/entities/response_model.dart';
// import '../../data/models/entities/services_hours_model.dart';

// class AgendaBloc extends ChangeNotifier {
//   int? _personID = 0;

//   int? _serviceID = 0;

//   set setPersonID(int? v) {
//     _personID = v;
//     notifyListeners();
//   }

//   set setServiceID(int? v) {
//     _serviceID = v;
//     notifyListeners();
//   }

//   //
//   PersonRangeDateModel? _rangeDatePerson;

//   PersonRangeDateModel? get rangeDatePerson {
//     return _rangeDatePerson;
//   }
//   //
//   //

//   // CAPTURAR

// //
// //
// //

// //
// //
//   Booking? _bookingSeleccionado;
//   Booking? get bookingSeleccionado {
//     return _bookingSeleccionado;
//   }

//   set bookingSeleccionado(Booking? obj) {
//     _bookingSeleccionado = obj;
//     notifyListeners();
//   }

// //
//   ProgamTurnModel? _programTurnSelected;
//   ProgamTurnModel? get programTurnSelected {
//     return _programTurnSelected;
//   }

//   set programTurnSelected(ProgamTurnModel? obj) {
//     _programTurnSelected = obj;
//     notifyListeners();
//   }

//   String? _dateSelected;
//   String? get dateSelected {
//     return _dateSelected;
//   }

//   set dateSelected(String? obj) {
//     _dateSelected = obj;
//     notifyListeners();
//   }

//   //
//   List<ProgamTurnModel>? _listProgramTurnModel = [];

//   List<ProgamTurnModel> get lisProgramTurnModel {
//     return _listProgramTurnModel!;
//   }

//   //
//   //

//   ResponseModel? _error;
//   ResponseModel? get error => _error;
//   set error(ResponseModel? value) {
//     _error = value;
//     notifyListeners();
//   }

//   Future<void> _setError(ResponseModel error) async {
//     _isLoading = false;
//     _error = error;
//     notifyListeners();
//   }

//   //
//   bool _isLoading = false;

//   bool get isLoading {
//     return _isLoading;
//   }

//   bool _isLoadingTurn = false;

//   bool get isLoadingTurn {
//     return _isLoadingTurn;
//   }

//   //
  

//   Future<bool> getRandeDatePerson() async {
//     _rangeDatePerson = null;
//     _isLoading = true;
//     notifyListeners();

//     final _response = await APIServices.personGetRangeDate(_personID!);
//     _isLoading = false;

//     if (_response.statusCode != 200) {
//       await _setError(_response);
//       return false;
//     }

//     _rangeDatePerson = _response.data;

//     notifyListeners();
//     return true;
//   }

//   Future<bool> getProgramTurn(String date) async {
//     // TOMAMOS DATE
//     _dateSelected = date;
//     // TOMAMOS DATE

//     _isLoadingTurn = true;
//     _listProgramTurnModel = [];
//     _programTurnSelected = null;

//     notifyListeners();

//     final _response = await APIServices.programGetTurn(
//         serviceID: _serviceID!, personID: _personID!, date: date);
//     _isLoadingTurn = false;

//     if (_response.statusCode != 200) {
//       await _setError(_response);
//       return false;
//     }

//     _listProgramTurnModel = _response.data;

//     notifyListeners();
//     return true;
//   }

//   Future<ResponseModel<bool>> reprograBooking(
//       ReprogramRequest objRequest) async {
//     final rspta = await APIServices.reprogramBooking(obj: objRequest);
//     _error = rspta;
//     return rspta;
//   }

  
  
  
//   ANULAR
  
  
  
  
  
  
  

//   Future<ResponseModel<bool>> anularBookingService(
//       {required LoginResponse loginModel, required String reason}) async {
//     AnulaBookingRequest objRQ = AnulaBookingRequest();

//     objRQ.bookingId = _bookingSeleccionado?.bookingId;
//     objRQ.user = loginModel.userId;
//     objRQ.businessId = loginModel.userBusinessDto[0].businessId;
//     objRQ.businessIdent = loginModel.userBusinessDto[0].identification;

//     objRQ.reason = reason;
//     // var response = await confirmBooking(objRQ, _bookingId!);

//     // final _response = await APIServices.reprogramBooking(obj: objRQ);

//     // var response = await anulaBooking(objRQ);

//     // if (response.statusCode != 200) {
//     // notifyListeners();
//     // }
//     // return response;
//     throw '';
//   }

//   Future<ResponseModel<bool>> anulaBooking(
//       AnulaBookingRequest objRequest) async {
//     final rspta = await APIServices.anulaBookingAPI(obj: objRequest);
//     _error = rspta;
//     return rspta;
//   }





//   Future<ResponseModel<bool>> completeBookingService(
//       {required LoginResponse loginModel,
//       required String comentario,
//       required String priceFinal}) async {
//     CompleteBookingRequest obj = CompleteBookingRequest();

//     obj.bookingId = _bookingSeleccionado?.bookingId;
//     obj.authorizedUser = 0;
//     obj.businessId = loginModel.userBusinessDto[0].businessId;
//     obj.businessIdent = loginModel.userBusinessDto[0].identification;
//     obj.officeId = loginModel.userBusinessDto[0].officeId;
//     obj.completed = true;

//     obj.invoice = false;
//     obj.priceFinal = num.parse(priceFinal);
//     obj.comment = comentario;
//     obj.telephone = _bookingSeleccionado?.phoneNumber;
//     obj.emailAddress = _bookingSeleccionado?.emailAddress;

//     // var response = await confirmBooking(obj, _bookingId!);

//     // final _response = await APIServices.reprogramBooking(obj: obj);

//     var response = await completeBooking(obj);

//     if (response.statusCode != 200) {
//       notifyListeners();
//     }
//     return response;
//   }

//   Future<ResponseModel<bool>> completeBooking(
//       CompleteBookingRequest objRequest) async {
//     final rspta = await APIServices.completeBookingAPI(obj: objRequest);
//     _error = rspta;
//     return rspta;
//   }

  

//   void initProgram({required Booking bookingObj}) {
//     _bookingSeleccionado = bookingObj;
//     //

//     //
//     _listProgramTurnModel = [];
//     _programTurnSelected = null;
//     _serviceID = 0;
//     _isLoadingTurn = false;
//     _isLoading = false;
//     _rangeDatePerson = null;
//     _error = null;
//     notifyListeners();
//   }
// }
