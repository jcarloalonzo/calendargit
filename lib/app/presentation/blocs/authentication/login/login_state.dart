import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/login_screen_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.loading() = LoginStateLoading;
  factory LoginState.failed([String? failure]) = LoginStateFailed;
  factory LoginState.loaded({
    ErrorModel? error,
    required LoginScreenModel model,
  }) = LoginStateLoaded;
}
