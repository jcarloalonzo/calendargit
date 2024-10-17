import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/error_model/error_model.dart';
import 'home_state.dart';
import 'screen_model/home_screen_model.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.setError({required ErrorModel? error}) =
      HomeSetErrorEvent;
  const factory HomeEvent.changeState(HomeState state) = HomeChangeStateEvent;

  const factory HomeEvent.updateModel({required HomeScreenModel model}) =
      HomeUpdateModelEvent;
}
