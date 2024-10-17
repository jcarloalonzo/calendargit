import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../../../data/entities/requests/login_request.dart';
import '../../../data/entities/responses/validate_token_response.dart';
import '../../../data/services/local/secure_storage_service.dart';
import '../../../domain/models/business.dart';
import '../../../domain/models/user.dart';
import '../../../domain/usecases/provider/provider_validate_token_usecase.dart';
import '../../../domain/usecases/web_client/web_client_business_by_token_usecase.dart';
import '../../../domain/usecases/web_client/web_client_login_usecase.dart';
import '../general/session/session_bloc.dart';
import 'splash_state.dart';

enum TypeLogin { login, home, register, token, unallowedLicense, error }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required ProviderValidateTokenUsecase providerValidateTokenUsecase,
    required WebClientLoginUsecase webClientLoginUsecase,
    required WebClientBusinessByTokenUsecase webClientBusinessByTokenUsecase,
  })  : _providerValidateTokenUsecase = providerValidateTokenUsecase,
        _webClientLoginUsecase = webClientLoginUsecase,
        _webClientBusinessByTokenUsecase = webClientBusinessByTokenUsecase,
        super(SplashState.initial());
  final ProviderValidateTokenUsecase _providerValidateTokenUsecase;
  final WebClientLoginUsecase _webClientLoginUsecase;
  final WebClientBusinessByTokenUsecase _webClientBusinessByTokenUsecase;

  Future<TypeLogin> validateSession() async {
    try {
      final storage = getIt<SecureStorageService>();

      final String? token = await storage.getToken();
      print(await storage.getToken());
      if (token == null) return TypeLogin.token;
      final ValidateTokenResponse? validateToken = await _validateToken(token);
      if (validateToken == null) return TypeLogin.error;

      // Obteniendo la empresa..
      final Business? business = await businessByToken(token);
      if (business == null) return TypeLogin.token;

      // Licencia deshabilitada
      if (!validateToken.allowLicense) return TypeLogin.unallowedLicense;
      if (!validateToken.isRegister) return TypeLogin.register;

// Ahora validamos si existe usuario..
      final String? user = await storage.getUsername();
      final String? password = await storage.getPassword();
      if (user == null || password == null) return TypeLogin.login;

      final User? userResponse =
          await _authenticate(user: user.trim(), password: password.trim());
      if (userResponse == null) return TypeLogin.login;
      return TypeLogin.home;
    } catch (e) {
      return TypeLogin.error;
    }
    //
  }

  Future<ValidateTokenResponse?> _validateToken(String token) async {
    final response = await _providerValidateTokenUsecase.call(token: token);
    return response.when(
      left: (failure) {
        return null;
        //
      },
      right: (value) {
        //
        return value;
      },
    );
  }

  Future<Business?> businessByToken(String token) async {
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

  Future<User?> _authenticate(
      {required String user, required String password}) async {
    final int businessId = getIt<SessionBloc>().state.business!.businessId;
    final request = LoginRequest(
      businessId: businessId,
      emailAddress: user,
      passToken: password,
    );
    final response = await _webClientLoginUsecase.call(request: request);
    return response.when(
      left: (failure) {
        return null;
      },
      right: (value) async {
        await getIt<SecureStorageService>().setUsername(user);
        await getIt<SecureStorageService>().setPassword(password);
        getIt<SessionBloc>().updateUser(user: value);
        return value;
      },
    );
  }
}
