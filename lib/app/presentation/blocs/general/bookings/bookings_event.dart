import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'bookings_state.dart';
import 'screen_model/bookings_screen_model.dart';

part 'bookings_event.freezed.dart';

@freezed
class BookingsEvent with _$BookingsEvent {
  const factory BookingsEvent.setError({required ErrorModel? error}) =
      BookingsSetErrorEvent;
  const factory BookingsEvent.changeState(BookingsState state) =
      BookingsChangeStateEvent;

  const factory BookingsEvent.updateModel(
      {required BookingsScreenModel model}) = BookingsUpdateModelEvent;
}
