import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_config/enums.dart';
import '../../../../dependency_injection.dart';
import '../../../data/entities/requests/turn_professional_appointment_request.dart';
import '../../../domain/error_model/error_model.dart';
import '../../../domain/models/booking.dart';
import '../../../domain/models/professional_range_date_appointment.dart';
import '../../../domain/models/professional_turn_appointment.dart';
import '../../../domain/models/user.dart';
import '../../../domain/usecases/web_client/web_client_range_date_professional_appointment_usecase.dart';
import '../../../domain/usecases/web_client/web_client_turn_professional_appointment_usecase.dart';
import '../general/session/session_bloc.dart';
import 'reschedule_booking_event.dart';
import 'reschedule_booking_state.dart';
import 'screen_model/reschedule_booking_screen_model.dart';

class RescheduleBookingBloc
    extends Bloc<RescheduleBookingEvent, RescheduleBookingState> {
  RescheduleBookingBloc({
    required WebClientRangeDateProfessionalAppointmentUsecase
        webClientRangeDateProfessionalAppointmentUsecase,
    required WebClientTurnProfessionalAppointmentUsecase
        webClientTurnProfessionalAppointmentUsecase,
  })  : _webClientRangeDateProfessionalAppointmentUsecase =
            webClientRangeDateProfessionalAppointmentUsecase,
        _webClientTurnProfessionalAppointmentUsecase =
            webClientTurnProfessionalAppointmentUsecase,
        super(RescheduleBookingState.loading()) {
    on<RescheduleBookingSetErrorEvent>(_rescheduleBookingSetErrorEvent);
    on<RescheduleBookingChangeStateEvent>(_rescheduleBookingChangeStateEvent);
    on<RescheduleBookingUpdateModelEvent>(_rescheduleBookingUpdateModelEvent);
  }
  final WebClientRangeDateProfessionalAppointmentUsecase
      _webClientRangeDateProfessionalAppointmentUsecase;
  final WebClientTurnProfessionalAppointmentUsecase
      _webClientTurnProfessionalAppointmentUsecase;
  //
  //
  void _rescheduleBookingSetErrorEvent(
      RescheduleBookingSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RescheduleBookingStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _rescheduleBookingChangeStateEvent(
      RescheduleBookingChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _rescheduleBookingUpdateModelEvent(
      RescheduleBookingUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as RescheduleBookingStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const RescheduleBookingSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(RescheduleBookingSetErrorEvent(error: error));
  }

  void _updateModel(RescheduleBookingScreenModel model) {
    add(RescheduleBookingUpdateModelEvent(model: model));
  }

  RescheduleBookingScreenModel get _currentModel =>
      (state as RescheduleBookingStateLoaded).model;

  void init({required Booking booking}) async {
    try {
      final date = DateTime.now();

      final rangeDate = await _getRangeDateProfessional();
      final turns = await _getTurnProfessionalAppointment(
          serviceId: booking.serviceId, date: date);
      final model = RescheduleBookingScreenModel(
        booking: booking,
        date: date,
        rangeDate: rangeDate,
        turns: turns,
      );

      add(RescheduleBookingChangeStateEvent(
          RescheduleBookingState.loaded(model: model)));
    } catch (e) {
      add(RescheduleBookingChangeStateEvent(RescheduleBookingState.failed()));
    }
  }

  Future<ProfessionalRangeDateAppointment> _getRangeDateProfessional() async {
    final businessId = getIt<SessionBloc>().state.business!.businessId;
    final User user = getIt<SessionBloc>().state.user!;
    final response = await _webClientRangeDateProfessionalAppointmentUsecase
        .call(businessId: businessId, personId: user.personId);
    return response.when(
      left: (_) {
        throw _;
      },
      right: (value) {
        return value;
      },
    );
  }

  Future<void> getShiftsProfessionalDate({required DateTime date}) async {
    try {
      final User user = getIt<SessionBloc>().state.user!;

      final int serviceId = _currentModel.booking.serviceId;
      final turns = await _getTurnProfessionalAppointment(
          serviceId: serviceId, date: date);
      _setTurns(turns);
    } catch (e) {
      return;
    }
  }

  Future<List<ProfessionalTurnAppointment>> _getTurnProfessionalAppointment(
      {required int serviceId, required DateTime date}) async {
    final User user = getIt<SessionBloc>().state.user!;

    final TurnProfessionalAppointmentRequest request =
        TurnProfessionalAppointmentRequest(
      personId: user.personId,
      serviceId: serviceId,
      date: date,
    );
    final response = await _webClientTurnProfessionalAppointmentUsecase.call(
        request: request);

    return response.when(
      left: (failure) {
        return [];
      },
      right: (value) {
        return value;
      },
    );
  }

  void _setTurns(List<ProfessionalTurnAppointment> turns) {
    final model = _currentModel.copyWith(turns: turns, turnSelected: null);
    _updateModel(model);
  }

  void setTurnSelected(ProfessionalTurnAppointment turn) {
    final model = _currentModel.copyWith(turnSelected: turn);
    _updateModel(model);
  }

  void setDate(DateTime date) {
    final model = _currentModel.copyWith(date: date);
    _updateModel(model);
  }
}
