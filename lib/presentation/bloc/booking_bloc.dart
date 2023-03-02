import 'package:flutter/cupertino.dart';

import '../../data/models/entities/booking_detail_model.dart';
import '../../data/models/entities/confirm_booking_request.dart';
import '../../data/models/entities/login_model.dart';
import '../../data/models/entities/response_model.dart';
import '../../data/services/api_services.dart';

class BookingBloc extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  int? _typePayment;

  int? get typePayment {
    return _typePayment;
  }

  set typePayment(int? value) {
    _typePayment = value;
    notifyListeners();
  }

  void changeTypePayment(int value) {
    _typePayment = value;
    notifyListeners();
  }

//
  int? _bookingId;

  int? get bookingId {
    return _bookingId;
  }

//
  ResponseModel? _responseModel;
  ResponseModel? get responseModel {
    return _responseModel;
  }

  set responseModel(ResponseModel? v) {
    _responseModel = v;
    notifyListeners();
  }
//
//

  BookingDetail? _bookingDetail;

  BookingDetail? get bookingDetail {
    return _bookingDetail;
  }

  //
  BookingInvoice? _bookingInvoice;

  BookingInvoice? get bookingInvoice {
    return _bookingInvoice;
  }

  //
  //
  bool? _onlyView = false;
  bool? get onlyView {
    return _onlyView;
  }

  set onlyView(bool? v) {
    _onlyView = v;
    notifyListeners();
  }

  //
  bool? _enableButtom = false;
  bool? get enableButtom {
    return _enableButtom;
  }

  set enableButtom(bool? v) {
    _enableButtom = v;
    notifyListeners();
  }
  //

  set checkBokCompleted(bool? v) {
    _bookingDetail?.completed = v;

    if (!_bookingDetail!.completed!) {
      _bookingDetail?.invoiceState = false;
      _enableButtom = false;
      _typePayment = 1;
    } else {
      _enableButtom = true;
    }
    notifyListeners();
  }

  set checkInvoiceState(bool? v) {
    _bookingDetail?.invoiceState = v;
    notifyListeners();
  }

  void setTelephone(String v) {
    _bookingDetail?.bookingClient?.phoneNumber = v;

    notifyListeners();
  }

  void setEmail(String v) {
    _bookingDetail?.bookingClient?.emailAddress = v;

    notifyListeners();
  }

  void setObservation(String v) {
    _bookingDetail?.observation = v;

    notifyListeners();
  }

  void setPayment(String? v) {
    if (v!.isEmpty) {
      _bookingDetail?.bookingInvoice?.payment = 0;
      notifyListeners();
      return;
    }

    _bookingDetail?.bookingInvoice?.payment = num.parse(v);
    notifyListeners();
  }

  //
  void setAmount(num v) {
    _bookingDetail?.priceFinal = v;
    _bookingInvoice?.amount = v;
    _bookingDetail!.bookingInvoice!.payment = v;
    notifyListeners();
  }

  num getVuelto() {
    var payment = _bookingDetail!.bookingInvoice!.payment!;
    var amount = _bookingDetail!.bookingInvoice!.amount!;
    _enableButtom = true;
    if (payment >= amount) {
      num a = payment - amount;
      return a;
    }
    _enableButtom = false;
    return 0;
  }

  Future<ResponseModel<bool>> confirmBooking(
      ConfirmBookingRequest objRequest, int bookingId) async {
    final rspta = await APIServices.confirmBooking(objRequest, bookingId);
    _responseModel = rspta;
    return rspta;
  }
  //
  //

  Future<void> serviceGetOnline(int bookingId) async {
    _isLoading = true;
    _bookingDetail = null;
    final rspta = await APIServices.getBookingDetail(bookingId);
    _responseModel = rspta;
    try {
      if (rspta?.statusCode == 200) {
        _bookingDetail = rspta?.data;
      }
      _isLoading = false;
      //  notifyListeners();
      return;
    } catch (e) {
      _responseModel?.error?.message = e.toString();
      _isLoading = false;
      return;
    }
  }

  void init(
      {int? bookingID, required int businessID, required int personID}) async {
    _typePayment = 1;
    _bookingId = bookingID;
    await serviceGetOnline(bookingID!);

    if (_bookingDetail != null) {
      // SI LOS DOS SON TRUE SE INHABILITA - SOLO VISTA
      if (_bookingDetail!.completed! && _bookingDetail!.invoiceState!) {
        _enableButtom = false;
        _onlyView = true;
      } else if (!_bookingDetail!.completed!) {
        _enableButtom = false;
        _onlyView = false;
      } else if (!_bookingDetail!.invoiceState!) {
        _enableButtom = true;
        _onlyView = false;
      }
      if (_bookingDetail?.bookingInvoice == null) {
        _bookingInvoice = BookingInvoice(
            amount: _bookingDetail?.priceFinal,
            taxAmount1: 0,
            taxPorc1: 0,
            taxPorc: 0,
            subAmount: _bookingDetail?.priceFinal,
            payment: _bookingDetail?.priceFinal,
            typePayment: 1);
        _bookingDetail!.bookingInvoice = _bookingInvoice;
      } else {
        _bookingInvoice = _bookingDetail?.bookingInvoice;
        _typePayment = _bookingDetail!.bookingInvoice!.typePayment!.toInt();
      }
    }
    notifyListeners();
  }

  Future<ResponseModel<bool>> confirmButtom(LoginModel loginModel) async {
    ConfirmBookingRequest objRQ = ConfirmBookingRequest();
    objRQ.authorizedUser = loginModel.userId;
    objRQ.businessId = loginModel.userBusinessDto?[0].businessId;
    objRQ.businessIdent = loginModel.userBusinessDto?[0].identification;
    objRQ.officeId = loginModel.userBusinessDto?[0].officeId;
    objRQ.completed = _bookingDetail?.completed;
    objRQ.invoice = _bookingDetail?.invoiceState;
    objRQ.priceFinal = _bookingDetail?.priceFinal;

    objRQ.comment = _bookingDetail?.observation;
    objRQ.telephone = _bookingDetail?.bookingClient?.phoneNumber;
    objRQ.emailAddress = _bookingDetail?.bookingClient?.emailAddress;
    objRQ.subAmount = _bookingDetail?.bookingInvoice?.amount;

    objRQ.taxPorc = _bookingDetail?.bookingInvoice?.taxPorc;
    objRQ.taxAmount = _bookingDetail?.bookingInvoice?.taxAmount;
    objRQ.taxPorc1 = _bookingDetail?.bookingInvoice?.taxPorc1;
    objRQ.taxAmount1 = _bookingDetail?.bookingInvoice?.taxAmount1;
    objRQ.amount = _bookingDetail?.bookingInvoice?.amount;

    objRQ.typePayment = _typePayment;
    objRQ.payment = _bookingDetail?.bookingInvoice?.payment;

    objRQ.dscto = 0; //temporalmente

    var response = await confirmBooking(objRQ, _bookingId!);

    if (response.statusCode != 200) {
      notifyListeners();
    }
    return response;
  }
}
