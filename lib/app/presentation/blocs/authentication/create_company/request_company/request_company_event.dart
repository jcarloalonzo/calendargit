import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'request_company_state.dart';
import 'screen_model/request_company_screen_model.dart';

part 'request_company_event.freezed.dart';

@freezed
class RequestCompanyEvent with _$RequestCompanyEvent {
  const factory RequestCompanyEvent.setError({required ErrorModel? error}) =
      RequestCompanySetErrorEvent;
  const factory RequestCompanyEvent.changeState(RequestCompanyState state) =
      RequestCompanyChangeStateEvent;

  const factory RequestCompanyEvent.updateModel(
          {required RequestCompanyScreenModel model}) =
      RequestCompanyUpdateModelEvent;
}
