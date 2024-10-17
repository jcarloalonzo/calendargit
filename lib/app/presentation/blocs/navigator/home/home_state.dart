import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'screen_model/home_screen_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.loading() = HomeStateLoading;
  factory HomeState.failed([String? failure]) = HomeStateFailed;
  factory HomeState.loaded({
    ErrorModel? error,
    required HomeScreenModel model,
  }) = HomeStateLoaded;
}
