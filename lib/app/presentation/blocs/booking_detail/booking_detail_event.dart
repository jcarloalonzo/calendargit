import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'booking_detail_state.dart';
import 'screen_model/booking_detail_screen_model.dart';

part 'booking_detail_event.freezed.dart';

@freezed
class BookingDetailEvent with _$BookingDetailEvent {
  const factory BookingDetailEvent.setError({required ErrorModel? error}) =
      BookingDetailSetErrorEvent;
  const factory BookingDetailEvent.changeState(BookingDetailState state) =
      BookingDetailChangeStateEvent;

  const factory BookingDetailEvent.updateModel(
          {required BookingDetailScreenModel model}) =
      BookingDetailUpdateModelEvent;
}
