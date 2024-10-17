import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'login_state.dart';
import 'screen_model/login_screen_model.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.setError({required ErrorModel? error}) =
      LoginSetErrorEvent;
  const factory LoginEvent.changeState(LoginState state) =
      LoginChangeStateEvent;

  const factory LoginEvent.updateModel({required LoginScreenModel model}) =
      LoginUpdateModelEvent;
}
