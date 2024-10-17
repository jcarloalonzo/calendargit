import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/register_screen_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.loading() = RegisterStateLoading;
  factory RegisterState.failed([String? failure]) = RegisterStateFailed;
  factory RegisterState.loaded({
    ErrorModel? error,
    required RegisterScreenModel model,
  }) = RegisterStateLoaded;
}
