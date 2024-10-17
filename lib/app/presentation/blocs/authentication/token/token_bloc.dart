import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/app_config/enums.dart';
import '../../../../../dependency_injection.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../data/entities/responses/validate_token_response.dart';
import '../../../../data/services/local/secure_storage_service.dart';
import '../../../../domain/error_model/error_model.dart';
import '../../../../domain/models/business.dart';
import '../../../../domain/usecases/provider/provider_validate_token_usecase.dart';
import '../../../../domain/usecases/web_client/web_client_business_by_token_usecase.dart';
import '../../general/session/session_bloc.dart';
import '../../splash/splash_cubit.dart';
import 'screen_model/token_screen_model.dart';
import 'token_event.dart';
import 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc({
    required ProviderValidateTokenUsecase providerValidateTokenUsecase,
    required WebClientBusinessByTokenUsecase webClientBusinessByTokenUsecase,
  })  : _providerValidateTokenUsecase = providerValidateTokenUsecase,
        _webClientBusinessByTokenUsecase = webClientBusinessByTokenUsecase,
        super(TokenState.loading()) {
    on<TokenSetErrorEvent>(_tokenSetErrorEvent);
    on<TokenChangeStateEvent>(_tokenChangeStateEvent);
    on<TokenUpdateModelEvent>(_tokenUpdateModelEvent);
  }
  final ProviderValidateTokenUsecase _providerValidateTokenUsecase;
  final WebClientBusinessByTokenUsecase _webClientBusinessByTokenUsecase;
  //
  //
  void _tokenSetErrorEvent(TokenSetErrorEvent event, Emitter<dynamic> emit) {
    final currentState = (state as TokenStateLoaded);
    final newState = currentState.copyWith(error: event.error);
    emit(newState);
  }

  void _tokenChangeStateEvent(
      TokenChangeStateEvent event, Emitter<dynamic> emit) {
    emit(event.state);
  }

  void _tokenUpdateModelEvent(
      TokenUpdateModelEvent event, Emitter<dynamic> emit) {
    final currentState = (state as TokenStateLoaded);
    final newState = currentState.copyWith(model: event.model, error: null);
    emit(newState);
  }

//
//
  void cleanError() {
    add(const TokenSetErrorEvent(error: null));
  }

  void setError(String message, {DialogType typeError = DialogType.warning}) {
    ErrorModel error = ErrorModel(message: message, dialogType: typeError);
    add(TokenSetErrorEvent(error: error));
  }

  void _updateModel(TokenScreenModel model) {
    add(TokenUpdateModelEvent(model: model));
  }

  TokenScreenModel get _currentModel => (state as TokenStateLoaded).model;

  void init() {
    try {
      final model = TokenScreenModel();

      add(TokenChangeStateEvent(TokenState.loaded(model: model)));
    } catch (e) {
      add(TokenChangeStateEvent(TokenState.failed()));
    }
  }

  Future<TypeLogin?> process({required String token}) async {
    try {
      if (token.trim().isEmpty) {
        setError('message');
        return null;
      }

      final ValidateTokenResponse? tokenResponse = await _validateToken(token);
      if (tokenResponse == null) return null;

      // Guardando en el storage...
      getIt<SecureStorageService>().setToken(token);

      final Business? business = await _businessByToken(token);
      if (business == null) return TypeLogin.register;

      // Si no está registrado lo manda a la pantalla de registro...
      if (!tokenResponse.isRegister) return TypeLogin.register;

      // Si está todo ok.. redirige al login
      return TypeLogin.login;
    } catch (e) {
      setError(texts.messages.somethingWentWrongContactAdministrator);
      return null;
    }
  }

  Future<ValidateTokenResponse?> _validateToken(String token) async {
    final response = await _providerValidateTokenUsecase.call(token: token);
    return response.when(
      left: (failure) {
        setError(failure);
        return;
      },
      right: (value) {
        return value;
      },
    );
  }

  // Future<Company?> _companyByToken(String token) async {
  //   final response = await _providerCompanyByTokenUsecase.call(token: token);
  //   return response.when(
  //     left: (failure) {
  //       setError(failure);
  //       return;
  //     },
  //     right: (company) {
  //       // Guardando en memoria
  //       getIt<SessionBloc>().updateCompany(company: company);
  //       return company;
  //     },
  //   );
  // }

  Future<Business?> _businessByToken(String token) async {
    final response = await _webClientBusinessByTokenUsecase.call(token: token);
    return response.when(
      left: (failure) {
        return null;
      },
      right: (value) {
        getIt<SessionBloc>().updateBusiness(business: value);
        return value;
      },
    );
  }
}
