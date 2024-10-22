import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../../dependency_injection.dart';
import '../../../../data/entities/requests/booking_list_request.dart';
import '../../../../domain/error_model/error_model.dart';
import '../../../../domain/models/booking.dart';
import '../../../../domain/models/business.dart';
import '../../../../domain/models/user.dart';
import '../../../../domain/usecases/web_client/web_client_booking_list_usecase.dart';
import '../session/session_bloc.dart';
import 'bookings_event.dart';
import 'bookings_state.dart';
import 'screen_model/bookings_screen_model.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc(
      {required WebClientBookingListUsecase webClientBookingListUsecase})
      : _webClientBookingListUsecase = webClientBookingListUsecase,
        super(BookingsState.loading()) {
    on<BookingsSetErrorEvent>(_bookingsSetErrorEvent);
    on<BookingsChangeStateEvent>(_bookingsChangeStateEvent);
    on<BookingsUpdateModelEvent>(_bookingsUpdateModelEvent);
  }
  final WebClientBookingListUsecase _webClientBookingListUsecase;
  void _bookingsSetErrorEvent(
      BookingsSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingsStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _bookingsChangeStateEvent(
      BookingsChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _bookingsUpdateModelEvent(
      BookingsUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as BookingsStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const BookingsSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(BookingsSetErrorEvent(error: error));
  }

  void _updateModel(BookingsScreenModel model) {
    add(BookingsUpdateModelEvent(model: model));
  }

  BookingsScreenModel get _currentModel => (state as BookingsStateLoaded).model;

  void init() async {
    try {
      final dateNow = DateTime.now();

      final bookings = await _getBookings(dateNow);
      final model = BookingsScreenModel(bookings: bookings, date: dateNow);

      add(BookingsChangeStateEvent(BookingsState.loaded(model: model)));
    } catch (e) {
      add(BookingsChangeStateEvent(BookingsState.failed()));
    }
  }

  Future<List<Booking>> _getBookings(DateTime date) async {
    final User user = getIt<SessionBloc>().state.user!;
    final Business business = getIt<SessionBloc>().state.business!;
    final request = BookingListRequest(
      businessId: business.businessId,
      personId: user.personId,
      initialDate: date,
      finalDate: date,
      bookingStateId: 0,
    );
    final response = await _webClientBookingListUsecase.call(request: request);
    return response.when(
      left: (failure) {
        throw '';
      },
      right: (value) {
        return value;
      },
    );
  }

  void setBookings(List<Booking> value) {
    final model = _currentModel.copyWith(bookings: value);
    _updateModel(model);
  }

  void setDate(DateTime value) {
    final model = _currentModel.copyWith(date: value);
    _updateModel(model);
  }

  Future<void> getBookingsList({required DateTime date}) async {
    try {
      final response = await _getBookings(date);
      setBookings(response);
    } catch (e) {
      add(BookingsChangeStateEvent(BookingsState.failed()));
    }
  }

  Future<void> refreshBookings() async {
    try {
      final response = await _getBookings(_currentModel.date);
      setBookings(response);
    } catch (e) {
      add(BookingsChangeStateEvent(BookingsState.failed()));
    }
  }

  void logout() {
    add(BookingsChangeStateEvent(BookingsState.loading()));
  }
}
