import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/bookings_screen_model.dart';

part 'bookings_state.freezed.dart';

@freezed
class BookingsState with _$BookingsState {
  factory BookingsState.loading() = BookingsStateLoading;
  factory BookingsState.failed([String? failure]) = BookingsStateFailed;
  factory BookingsState.loaded({
    ErrorModel? error,
    required BookingsScreenModel model,
  }) = BookingsStateLoaded;
}
