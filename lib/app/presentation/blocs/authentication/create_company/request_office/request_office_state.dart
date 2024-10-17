import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/request_office_screen_model.dart';

part 'request_office_state.freezed.dart';

@freezed
class RequestOfficeState with _$RequestOfficeState {
  factory RequestOfficeState.loading() = RequestOfficeStateLoading;
  factory RequestOfficeState.failed([String? failure]) =
      RequestOfficeStateFailed;
  factory RequestOfficeState.loaded({
    ErrorModel? error,
    required RequestOfficeScreenModel model,
  }) = RequestOfficeStateLoaded;
}
