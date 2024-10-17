import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'request_office_state.dart';
import 'screen_model/request_office_screen_model.dart';

part 'request_office_event.freezed.dart';

@freezed
class RequestOfficeEvent with _$RequestOfficeEvent {
  const factory RequestOfficeEvent.setError({required ErrorModel? error}) =
      RequestOfficeSetErrorEvent;
  const factory RequestOfficeEvent.changeState(RequestOfficeState state) =
      RequestOfficeChangeStateEvent;

  const factory RequestOfficeEvent.updateModel(
          {required RequestOfficeScreenModel model}) =
      RequestOfficeUpdateModelEvent;
}
