import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/token_screen_model.dart';
import 'token_state.dart';

part 'token_event.freezed.dart';

@freezed
class TokenEvent with _$TokenEvent {
  const factory TokenEvent.setError({required ErrorModel? error}) =
      TokenSetErrorEvent;
  const factory TokenEvent.changeState(TokenState state) =
      TokenChangeStateEvent;

  const factory TokenEvent.updateModel({required TokenScreenModel model}) =
      TokenUpdateModelEvent;
}
