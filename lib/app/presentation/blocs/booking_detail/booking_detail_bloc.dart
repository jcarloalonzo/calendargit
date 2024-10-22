import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_config/enums.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../data/entities/requests/cancel_booking_request.dart';
import '../../../data/entities/requests/complete_booking_request.dart';
import '../../../domain/error_model/error_model.dart';
import '../../../domain/models/booking.dart';
import '../../../domain/usecases/web_client/web_client_cancel_booking_usecase.dart';
import '../../../domain/usecases/web_client/web_client_complete_booking_usecase.dart';
import '../../../domain/usecases/web_client/web_client_validate_reprogram_booking_usecase.dart';
import '../general/bookings/bookings_bloc.dart';
import '../general/session/session_bloc.dart';
import 'booking_detail_event.dart';
import 'booking_detail_state.dart';
import 'screen_model/booking_detail_screen_model.dart';

class BookingDetailBloc extends Bloc<BookingDetailEvent, BookingDetailState> {
  BookingDetailBloc({
    required WebClientCompleteBookingUsecase webClientCompleteBookingUsecase,
    required WebClientCancelBookingUsecase webClientCancelBookingUsecase,
    required WebClientValidateReprogramBookingUsecase
        webClientValidateReprogramBookingUsecase,
  })  : _webClientCompleteBookingUsecase = webClientCompleteBookingUsecase,
        _webClientCancelBookingUsecase = webClientCancelBookingUsecase,
        _webClientValidateReprogramBookingUsecase =
            webClientValidateReprogramBookingUsecase,
        super(BookingDetailState.loading()) {
    on<BookingDetailSetErrorEvent>(_bookingDetailSetErrorEvent);
    on<BookingDetailChangeStateEvent>(_bookingDetailChangeStateEvent);
    on<BookingDetailUpdateModelEvent>(_bookingDetailUpdateModelEvent);
  }
  final WebClientCompleteBookingUsecase _webClientCompleteBookingUsecase;
  final WebClientCancelBookingUsecase _webClientCancelBookingUsecase;
  final WebClientValidateReprogramBookingUsecase
      _webClientValidateReprogramBookingUsecase;
  //
  void _bookingDetailSetErrorEvent(
      BookingDetailSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingDetailStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _bookingDetailChangeStateEvent(
      BookingDetailChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _bookingDetailUpdateModelEvent(
      BookingDetailUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingDetailStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const BookingDetailSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(BookingDetailSetErrorEvent(error: error));
  }

  void _updateModel(BookingDetailScreenModel model) {
    add(BookingDetailUpdateModelEvent(model: model));
  }

  BookingDetailScreenModel get _currentModel =>
      (state as BookingDetailStateLoaded).model;

  void init({required Booking booking}) {
    try {
      final model = BookingDetailScreenModel(booking: booking);

      add(BookingDetailChangeStateEvent(
          BookingDetailState.loaded(model: model)));
    } catch (e) {
      add(BookingDetailChangeStateEvent(BookingDetailState.failed()));
    }
  }

  Future<bool> cancelBooking() async {
    try {
      final user = getIt<SessionBloc>().state.user!;
      final business = user.userBusinessData!;
      final request = CancelBookingRequest(
        user: user.userId,
        businessId: business.businessId,
        businessIdent: business.identification,
        reason: '',
      );
      final response = await _webClientCancelBookingUsecase.call(
          request: request, bookingId: _currentModel.booking.bookingId);
      return response.when(
        left: (failure) {
          setError(failure);
          return false;
        },
        right: (value) async {
          await getIt<BookingsBloc>().refreshBookings();
          return value;
        },
      );
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return false;
    }
  }

  Future<bool> completeBooking() async {
    try {
      final user = getIt<SessionBloc>().state.user!;
      final business = user.userBusinessData!;

      final request = CompleteBookingRequest(
        businessId: business.businessId,
        businessIdent: business.identification,
        authorizedUser: 0,
        officeId: business.officeId,
      );
      final response = await _webClientCompleteBookingUsecase.call(
          request: request, bookingId: _currentModel.booking.bookingId);
      return response.when(
        left: (failure) {
          setError(failure);
          return false;
        },
        right: (value) async {
          await getIt<BookingsBloc>().refreshBookings();
          return value;
        },
      );
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return false;
    }
  }

  Future<bool> validateCanReschedule() async {
    try {
      final response = await _webClientValidateReprogramBookingUsecase.call(
          bookingId: _currentModel.booking.bookingId);
      return response.when(
        left: (failure) {
          setError(failure);
          return false;
        },
        right: (value) {
          return value;
        },
      );
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return false;
    }
  }
}
