import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'request_login_state.dart';
import 'screen_model/request_login_screen_model.dart';

part 'request_login_event.freezed.dart';

@freezed
class RequestLoginEvent with _$RequestLoginEvent {
  const factory RequestLoginEvent.setError({required ErrorModel? error}) =
      RequestLoginSetErrorEvent;
  const factory RequestLoginEvent.changeState(RequestLoginState state) =
      RequestLoginChangeStateEvent;

  const factory RequestLoginEvent.updateModel(
      {required RequestLoginScreenModel model}) = RequestLoginUpdateModelEvent;
}
