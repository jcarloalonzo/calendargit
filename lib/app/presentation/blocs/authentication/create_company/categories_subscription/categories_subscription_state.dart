import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/error_model/error_model.dart';
import 'screen_model/categories_subscription_screen_model.dart';

part 'categories_subscription_state.freezed.dart';

@freezed
class CategoriesSubscriptionState with _$CategoriesSubscriptionState {
  factory CategoriesSubscriptionState.loading() =
      CategoriesSubscriptionStateLoading;
  factory CategoriesSubscriptionState.failed([String? failure]) =
      CategoriesSubscriptionStateFailed;
  factory CategoriesSubscriptionState.loaded({
    ErrorModel? error,
    required CategoriesSubscriptionScreenModel model,
  }) = CategoriesSubscriptionStateLoaded;
}
