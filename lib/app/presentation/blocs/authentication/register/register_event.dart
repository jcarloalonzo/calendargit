import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'register_state.dart';
import 'screen_model/register_screen_model.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.setError({required ErrorModel? error}) =
      RegisterSetErrorEvent;
  const factory RegisterEvent.changeState(RegisterState state) =
      RegisterChangeStateEvent;

  const factory RegisterEvent.updateModel(
      {required RegisterScreenModel model}) = RegisterUpdateModelEvent;
}
