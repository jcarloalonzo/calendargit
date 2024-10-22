import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/error_model/error_model.dart';
import 'screen_model/booking_detail_screen_model.dart';

part 'booking_detail_state.freezed.dart';

@freezed
class BookingDetailState with _$BookingDetailState {
  factory BookingDetailState.loading() = BookingDetailStateLoading;
  factory BookingDetailState.failed([String? failure]) =
      BookingDetailStateFailed;
  factory BookingDetailState.loaded({
    ErrorModel? error,
    required BookingDetailScreenModel model,
  }) = BookingDetailStateLoaded;
}
