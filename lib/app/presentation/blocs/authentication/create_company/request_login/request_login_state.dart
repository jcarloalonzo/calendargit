import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/request_login_screen_model.dart';

part 'request_login_state.freezed.dart';

@freezed
class RequestLoginState with _$RequestLoginState {
  factory RequestLoginState.loading() = RequestLoginStateLoading;
  factory RequestLoginState.failed([String? failure]) = RequestLoginStateFailed;
  factory RequestLoginState.loaded({
    ErrorModel? error,
    required RequestLoginScreenModel model,
  }) = RequestLoginStateLoaded;
}
