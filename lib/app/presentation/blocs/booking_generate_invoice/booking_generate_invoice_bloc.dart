import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_config/enums.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../data/entities/requests/generate_invoice_request.dart';
import '../../../data/entities/requests/payment_invoice_request.dart';
import '../../../data/entities/responses/generate_invoice_response.dart';
import '../../../domain/error_model/error_model.dart';
import '../../../domain/models/base.dart';
import '../../../domain/models/booking.dart';
import '../../../domain/models/user.dart';
import '../../../domain/models/user_business_dto.dart';
import '../../../domain/usecases/web_client/web_client_generate_invoice_usecase.dart';
import '../general/session/session_bloc.dart';
import 'booking_generate_invoice_event.dart';
import 'booking_generate_invoice_state.dart';
import 'screen_model/booking_generate_invoice_screen_model.dart';

class BookingGenerateInvoiceBloc
    extends Bloc<BookingGenerateInvoiceEvent, BookingGenerateInvoiceState> {
  BookingGenerateInvoiceBloc(
      {required WebClientGenerateInvoiceUsecase
          webClientGenerateInvoiceUsecase})
      : _webClientGenerateInvoiceUsecase = webClientGenerateInvoiceUsecase,
        super(BookingGenerateInvoiceState.loading()) {
    on<BookingGenerateInvoiceSetErrorEvent>(
        _bookingGenerateInvoiceSetErrorEvent);
    on<BookingGenerateInvoiceChangeStateEvent>(
        _bookingGenerateInvoiceChangeStateEvent);
    on<BookingGenerateInvoiceUpdateModelEvent>(
        _bookingGenerateInvoiceUpdateModelEvent);
  }

  final WebClientGenerateInvoiceUsecase _webClientGenerateInvoiceUsecase;

  void _bookingGenerateInvoiceSetErrorEvent(
      BookingGenerateInvoiceSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingGenerateInvoiceStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _bookingGenerateInvoiceChangeStateEvent(
      BookingGenerateInvoiceChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _bookingGenerateInvoiceUpdateModelEvent(
      BookingGenerateInvoiceUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingGenerateInvoiceStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const BookingGenerateInvoiceSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(BookingGenerateInvoiceSetErrorEvent(error: error));
  }

  void _updateModel(BookingGenerateInvoiceScreenModel model) {
    add(BookingGenerateInvoiceUpdateModelEvent(model: model));
  }

  BookingGenerateInvoiceScreenModel get _currentModel =>
      (state as BookingGenerateInvoiceStateLoaded).model;

  void init({required Booking booking}) {
    try {
      final List<Base> paymentsMethods = _getPaymentsMethods();
      final model = BookingGenerateInvoiceScreenModel(
        booking: booking,
        methodPayments: paymentsMethods,
        methodPayment: paymentsMethods.first,
        subTotal: booking.price,
      );

      add(BookingGenerateInvoiceChangeStateEvent(
          BookingGenerateInvoiceState.loaded(model: model)));
    } catch (e) {
      add(BookingGenerateInvoiceChangeStateEvent(
          BookingGenerateInvoiceState.failed()));
    }
  }

  List<Base> _getPaymentsMethods() {
    return [
      Base(id: 1, label: texts.label.cash),
      Base(id: 2, label: texts.label.card),
      Base(id: 3, label: 'ZELLE'),
    ];
  }

  //
  //
  num getTotal() {
    final num dscto = _currentModel.dscto;
    final num subTotal = _currentModel.subTotal;

    return subTotal - dscto;
  }

  void setDscto(num dscto) {
    final model = _currentModel.copyWith(dscto: dscto);
    _updateModel(model);
  }

  void setPaymentMethod(Base value) {
    final cash = getTotal();
    final model =
        _currentModel.copyWith(methodPayment: value, cash: cash, nroCard: '');
    _updateModel(model);
  }

  void setNumberCard(String value) {
    final model = _currentModel.copyWith(nroCard: value);
    _updateModel(model);
  }

  void setPaymentAmount(num value) {
    final model = _currentModel.copyWith(cash: value);
    _updateModel(model);
  }

  num getVuelto() {
    final total = getTotal();
    final payment = _currentModel.cash;
    return payment > total ? payment - total : 0;
  }

  bool _validateform() {
    final total = getTotal();
    final num payment = _currentModel.cash;

    if (payment < total) {
      setError(texts.messages.paymentCannotBeLessThanTheTotal);
      return false;
    }

    return true;
  }

  Future<GenerateInvoiceResponse?> generateInvoice() async {
    try {
      final bool validate = _validateform();
      if (!validate) return null;
      final request = _getRequest();
      final response = await _webClientGenerateInvoiceUsecase.call(
        request: request,
        bookingId: _currentModel.booking.bookingId,
      );
      return response.when(
        left: (failure) {
          setError(failure);
          return null;
        },
        right: (value) {
          return value;
        },
      );
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  GenerateInvoiceRequest _getRequest() {
    final User user = getIt<SessionBloc>().state.user!;
    final UserBusinessDto business = user.userBusinessData!;
    final req = GenerateInvoiceRequest(
      user: user.userId,
      businessId: business.businessId,
      businessIdent: business.identification,
      officeId: business.officeId,
      subAmount: _currentModel.subTotal,
      taxPorc: 0,
      taxAmount: 0,
      taxPorc1: 0,
      taxAmount1: 0,
      dscto: _currentModel.dscto,
      amount: getTotal(),
      listPayment: <PaymentInvoiceRequest>[
        PaymentInvoiceRequest(
          typePayment: _currentModel.methodPayment.id.toString(),
          numberCard: _currentModel.nroCard,
          numerOperation: '',
          amount: _currentModel.cash,
        ),
      ],
    );
    return req;
  }
}
