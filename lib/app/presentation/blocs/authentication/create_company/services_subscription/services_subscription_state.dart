import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/services_subscription_screen_model.dart';

part 'services_subscription_state.freezed.dart';

@freezed
class ServicesSubscriptionState with _$ServicesSubscriptionState {
  factory ServicesSubscriptionState.loading() =
      ServicesSubscriptionStateLoading;
  factory ServicesSubscriptionState.failed([String? failure]) =
      ServicesSubscriptionStateFailed;
  factory ServicesSubscriptionState.loaded({
    ErrorModel? error,
    required ServicesSubscriptionScreenModel model,
  }) = ServicesSubscriptionStateLoaded;
}
