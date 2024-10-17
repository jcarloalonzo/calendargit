import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/services_subscription_screen_model.dart';
import 'services_subscription_state.dart';

part 'services_subscription_event.freezed.dart';

@freezed
class ServicesSubscriptionEvent with _$ServicesSubscriptionEvent {
  const factory ServicesSubscriptionEvent.setError(
      {required ErrorModel? error}) = ServicesSubscriptionSetErrorEvent;
  const factory ServicesSubscriptionEvent.changeState(
      ServicesSubscriptionState state) = ServicesSubscriptionChangeStateEvent;

  const factory ServicesSubscriptionEvent.updateModel(
          {required ServicesSubscriptionScreenModel model}) =
      ServicesSubscriptionUpdateModelEvent;
}
