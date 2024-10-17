import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/request_company_screen_model.dart';

part 'request_company_state.freezed.dart';

@freezed
class RequestCompanyState with _$RequestCompanyState {
  factory RequestCompanyState.loading() = RequestCompanyStateLoading;
  factory RequestCompanyState.failed([String? failure]) =
      RequestCompanyStateFailed;
  factory RequestCompanyState.loaded({
    ErrorModel? error,
    required RequestCompanyScreenModel model,
  }) = RequestCompanyStateLoaded;
}
