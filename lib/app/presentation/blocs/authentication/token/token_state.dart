import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/token_screen_model.dart';

part 'token_state.freezed.dart';

@freezed
class TokenState with _$TokenState {
  factory TokenState.loading() = TokenStateLoading;
  factory TokenState.failed([String? failure]) = TokenStateFailed;
  factory TokenState.loaded({
    ErrorModel? error,
    required TokenScreenModel model,
  }) = TokenStateLoaded;
}
