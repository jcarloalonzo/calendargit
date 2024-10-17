import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'categories_subscription_state.dart';
import 'screen_model/categories_subscription_screen_model.dart';

part 'categories_subscription_event.freezed.dart';

@freezed
class CategoriesSubscriptionEvent with _$CategoriesSubscriptionEvent {
  const factory CategoriesSubscriptionEvent.setError(
      {required ErrorModel? error}) = CategoriesSubscriptionSetErrorEvent;
  const factory CategoriesSubscriptionEvent.changeState(
          CategoriesSubscriptionState state) =
      CategoriesSubscriptionChangeStateEvent;

  const factory CategoriesSubscriptionEvent.updateModel(
          {required CategoriesSubscriptionScreenModel model}) =
      CategoriesSubscriptionUpdateModelEvent;
}
