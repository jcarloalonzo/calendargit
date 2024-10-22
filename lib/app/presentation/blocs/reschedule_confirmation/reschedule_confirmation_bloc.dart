import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_config/enums.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../data/entities/requests/reschedule_booking_request.dart';
import '../../../domain/error_model/error_model.dart';
import '../../../domain/usecases/web_client/web_client_reschedule_booking_usecase.dart';
import '../general/bookings/bookings_bloc.dart';
import '../general/session/session_bloc.dart';
import '../reschedule_booking/screen_model/reschedule_booking_screen_model.dart';
import 'reschedule_confirmation_event.dart';
import 'reschedule_confirmation_state.dart';
import 'screen_model/reschedule_confirmation_screen_model.dart';

class RescheduleConfirmationBloc
    extends Bloc<RescheduleConfirmationEvent, RescheduleConfirmationState> {
  RescheduleConfirmationBloc(
      {required WebClientRescheduleBookingUsecase
          webClientRescheduleBookingUsecase})
      : _webClientRescheduleBookingUsecase = webClientRescheduleBookingUsecase,
        super(RescheduleConfirmationState.loading()) {
    on<RescheduleConfirmationSetErrorEvent>(
        _rescheduleConfirmationSetErrorEvent);
    on<RescheduleConfirmationChangeStateEvent>(
        _rescheduleConfirmationChangeStateEvent);
    on<RescheduleConfirmationUpdateModelEvent>(
        _rescheduleConfirmationUpdateModelEvent);
  }

  final WebClientRescheduleBookingUsecase _webClientRescheduleBookingUsecase;
  void _rescheduleConfirmationSetErrorEvent(
      RescheduleConfirmationSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RescheduleConfirmationStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _rescheduleConfirmationChangeStateEvent(
      RescheduleConfirmationChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _rescheduleConfirmationUpdateModelEvent(
      RescheduleConfirmationUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RescheduleConfirmationStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const RescheduleConfirmationSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RescheduleConfirmationSetErrorEvent(error: error));
  }

  void _updateModel(RescheduleConfirmationScreenModel model) {
    add(RescheduleConfirmationUpdateModelEvent(model: model));
  }

  RescheduleConfirmationScreenModel get _currentModel =>
      (state as RescheduleConfirmationStateLoaded).model;

  void init({required RescheduleBookingScreenModel stepModel}) {
    try {
      final model = RescheduleConfirmationScreenModel(
        booking: stepModel.booking,
        date: stepModel.date,
        turnSelected: stepModel.turnSelected!,
      );

      add(RescheduleConfirmationChangeStateEvent(
          RescheduleConfirmationState.loaded(model: model)));
    } catch (e) {
      add(RescheduleConfirmationChangeStateEvent(
          RescheduleConfirmationState.failed()));
    }
  }

  Future<bool> reschedule() async {
    try {
      final bookingId = _currentModel.booking.bookingId;
      final user = getIt<SessionBloc>().state.user!;
      final business = user.userBusinessData!;
      final request = RescheduleBookingRequest(
        user: user.userId,
        businessIdent: business.identification,
        date: _currentModel.date,
        initialTime: _currentModel.turnSelected.initialTurn,
        finalTime: _currentModel.turnSelected.finalTurn,
        registerUser: 0,
      );

      final response = await _webClientRescheduleBookingUsecase.call(
          request: request, bookingId: bookingId);

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
}
