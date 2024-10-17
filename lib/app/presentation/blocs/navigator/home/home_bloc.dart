import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../domain/error_model/error_model.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'screen_model/home_screen_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.loading()) {
    on<HomeSetErrorEvent>(_homeSetErrorEvent);
    on<HomeChangeStateEvent>(_homeChangeStateEvent);
    on<HomeUpdateModelEvent>(_homeUpdateModelEvent);
  }

  void _homeSetErrorEvent(HomeSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as HomeStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _homeChangeStateEvent(
      HomeChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _homeUpdateModelEvent(
      HomeUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as HomeStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

  void cleanError() {
    add(const HomeSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(HomeSetErrorEvent(error: error));
  }

  void _updateModel(HomeScreenModel model) {
    add(HomeUpdateModelEvent(model: model));
  }

  HomeScreenModel get _currentModel => (state as HomeStateLoaded).model;

  void init() {
    try {
      final model = HomeScreenModel(
        date: DateTime.now(),
      );

      add(HomeChangeStateEvent(HomeState.loaded(model: model)));
    } catch (e) {
      add(HomeChangeStateEvent(HomeState.failed()));
    }
  }

  void setDate(DateTime date) {
    final model = _currentModel.copyWith(date: date);
    _updateModel(model);
  }

  getBookingDate() async {
    try {
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      return;
    }
  }
}
