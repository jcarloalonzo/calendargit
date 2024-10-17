import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../../dependency_injection.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../data/entities/requests/login_request.dart';
import '../../../../data/services/local/secure_storage_service.dart';
import '../../../../domain/error_model/error_model.dart';
import '../../../../domain/models/user.dart';
import '../../../../domain/usecases/web_client/web_client_login_usecase.dart';
import '../../general/session/session_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'screen_model/login_screen_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required WebClientLoginUsecase webClientLoginUsecase,
  })  : _webClientLoginUsecase = webClientLoginUsecase,
        super(LoginState.loading()) {
    on<LoginSetErrorEvent>(_loginSetErrorEvent);
    on<LoginChangeStateEvent>(_loginChangeStateEvent);
    on<LoginUpdateModelEvent>(_loginUpdateModelEvent);
  }

  final WebClientLoginUsecase _webClientLoginUsecase;

  void _loginSetErrorEvent(LoginSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as LoginStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _loginChangeStateEvent(
      LoginChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _loginUpdateModelEvent(
      LoginUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as LoginStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const LoginSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(LoginSetErrorEvent(error: error));
  }

  void _updateModel(LoginScreenModel model) {
    add(LoginUpdateModelEvent(model: model));
  }

  LoginScreenModel get _currentModel => (state as LoginStateLoaded).model;

  void init() {
    try {
      final model = LoginScreenModel();

      add(LoginChangeStateEvent(LoginState.loaded(model: model)));
    } catch (e) {
      add(LoginChangeStateEvent(LoginState.failed()));
    }
  }

  void setUsername(String value) {
    final model = _currentModel.copyWith(username: value);
    _updateModel(model);
  }

  void setPassword(String value) {
    final model = _currentModel.copyWith(password: value);
    _updateModel(model);
  }

  bool _validateForm() {
    final username = _currentModel.username.trim();
    final password = _currentModel.password.trim();

    if (username.isEmpty) {
      setError(texts.messages.youMustEnterTheUsernameOrEmail);
      return false;
    }
    if (password.isEmpty) {
      setError(texts.messages.youMustEnterThePassword);
      return false;
    }

    return true;
  }

  Future<User?> login() async {
    try {
      final validate = _validateForm();
      if (!validate) return null;
      final user = await _authenticate();
      return user;
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return null;
    }
  }

  Future<User?> _authenticate() async {
    final int businessId = getIt<SessionBloc>().state.business!.businessId;
    final String username = _currentModel.username.trim();
    final String password = _currentModel.password.trim();
    final request = LoginRequest(
      businessId: businessId,
      emailAddress: username,
      passToken: password,
    );
    final response = await _webClientLoginUsecase.call(request: request);
    return response.when(
      left: (failure) {
        setError(failure);
        return null;
      },
      right: (value) async {
        await getIt<SecureStorageService>().setUsername(username);
        await getIt<SecureStorageService>().setPassword(password);
        getIt<SessionBloc>().updateUser(user: value);
        return value;
      },
    );
  }
}
