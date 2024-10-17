import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'app/data/datasources/provider_datasource_impl.dart';
import 'app/data/datasources/web_client_datasource_impl.dart';
import 'app/data/http/http.dart';
import 'app/data/repositories/provider_repository_impl.dart';
import 'app/data/repositories/web_client_repository_impl.dart';
import 'app/data/services/local/flutter_secure_storage_adapter.dart';
import 'app/data/services/local/secure_storage_service.dart';
import 'app/data/services/local/secure_storage_service_impl.dart';
import 'app/data/services/remote/provider_api.dart';
import 'app/data/services/remote/web_client_api.dart';
import 'app/domain/datasources/provider_datasource.dart';
import 'app/domain/datasources/web_client_datasource.dart';
import 'app/domain/repositories/provider_repository.dart';
import 'app/domain/repositories/web_client_repository.dart';
import 'app/domain/usecases/provider/provider_company_by_token_usecase.dart';
import 'app/domain/usecases/provider/provider_sincronization_token_usecase.dart';
import 'app/domain/usecases/provider/provider_validate_token_usecase.dart';
import 'app/domain/usecases/web_client/web_client_business_by_token_usecase.dart';
import 'app/domain/usecases/web_client/web_client_company_create_usecase.dart';
import 'app/domain/usecases/web_client/web_client_create_worker_usecase.dart';
import 'app/domain/usecases/web_client/web_client_details_services_worker_usecase.dart';
import 'app/domain/usecases/web_client/web_client_get_categories_usecase.dart';
import 'app/domain/usecases/web_client/web_client_login_usecase.dart';
import 'app/domain/usecases/web_client/web_client_services_by_business_usecase.dart';
import 'app/domain/usecases/web_client/web_client_services_by_categories_usecase.dart';
import 'app/domain/usecases/web_client/web_client_set_Services_worker_usecase.dart';
import 'app/domain/usecases/web_client/web_client_workers_usecase.dart';
import 'app/presentation/blocs/authentication/create_company/categories_subscription/categories_subscription_bloc.dart';
import 'app/presentation/blocs/authentication/create_company/request_company/request_company_bloc.dart';
import 'app/presentation/blocs/authentication/create_company/request_login/request_login_bloc.dart';
import 'app/presentation/blocs/authentication/create_company/request_office/request_office_bloc.dart';
import 'app/presentation/blocs/authentication/create_company/services_subscription/services_subscription_bloc.dart';
import 'app/presentation/blocs/authentication/login/login_bloc.dart';
import 'app/presentation/blocs/authentication/register/register_bloc.dart';
import 'app/presentation/blocs/authentication/token/token_bloc.dart';
import 'app/presentation/blocs/general/session/session_bloc.dart';
import 'app/presentation/blocs/navigator/home/home_bloc.dart';
import 'app/presentation/blocs/splash/splash_cubit.dart';
import 'app/presentation/blocs/workers/new_worker/new_worker_step_one/new_worker_step_one_bloc.dart';
import 'app/presentation/blocs/workers/new_worker/new_worker_step_two/new_worker_step_two_bloc.dart';
import 'app/presentation/blocs/workers/new_worker/set_services_worker/set_services_worker_bloc.dart';
import 'app/presentation/blocs/workers/worker_detail/worker_detail_bloc.dart';
import 'app/presentation/blocs/workers/workers/workers_bloc.dart';
import 'config/app_config/environment.dart';

final getIt = GetIt.instance;

void init() {
  //! Blocs
  getIt.registerFactory(() => SplashCubit(
        // userLoginUsecase: getIt(),
        providerValidateTokenUsecase: getIt(),
        webClientLoginUsecase: getIt(),
        webClientBusinessByTokenUsecase: getIt(),
      ));

  getIt.registerFactory(() => TokenBloc(
        providerValidateTokenUsecase: getIt(),
        webClientBusinessByTokenUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => RegisterBloc(
      // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => LoginBloc(
        webClientLoginUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => CategoriesSubscriptionBloc(
        // userLoginUsecase: getIt(),
        webClientGetCategoriesUsecase: getIt(),
        webClientCompanyCreateUsecase: getIt(),
        providerSincronizationTokenUsecase: getIt(),
      ));

  getIt.registerFactory(() => RequestCompanyBloc(
        // userLoginUsecase: getIt(),
        providerCompanyByTokenUsecase: getIt(),
      ));

  getIt.registerFactory(() => RequestLoginBloc(
      // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => RequestOfficeBloc(
      // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => ServicesSubscriptionBloc(
        webClientServicesByCategoriesUsecase: getIt(),
        webClientCompanyCreateUsecase: getIt(),
        providerSincronizationTokenUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => WorkersBloc(
        webClientWorkersUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => NewWorkerStepOneBloc(
      // userLoginUsecase: getIt(),
      ));
  getIt.registerFactory(() => NewWorkerStepTwoBloc(
        webClientCreateWorkerUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));
  getIt.registerFactory(() => SetServicesWorkerBloc(
        webClientServicesByBusinessUsecase: getIt(),
        webClientSetServicesWorkerUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));
  getIt.registerFactory(() => WorkerDetailBloc(
        webClientDetailsServicesWorkerUsecase: getIt(),
        // userLoginUsecase: getIt(),
      ));

  getIt.registerFactory(() => HomeBloc(
      // userLoginUsecase: getIt(),
      ));

  // getIt.registerFactory(() => LoginBloc(
  //       userLoginUsecase: getIt(),
  //     ));
  //! Usecases
  // WEbClient

  getIt.registerLazySingleton(() => WebClientLoginUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientBusinessByTokenUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientDetailsServicesWorkerUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientWorkersUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientSetServicesWorkerUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientServicesByBusinessUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientCreateWorkerUsecase(repository: getIt()));

  getIt.registerLazySingleton(
      () => WebClientGetCategoriesUsecase(repository: getIt()));

  getIt.registerLazySingleton(
      () => WebClientServicesByCategoriesUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WebClientCompanyCreateUsecase(repository: getIt()));
  // Provider
  getIt.registerLazySingleton(
      () => ProviderValidateTokenUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => ProviderCompanyByTokenUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => ProviderSincronizationTokenUsecase(repository: getIt()));

  //! Repository
  getIt.registerLazySingleton<ProviderRepository>(
      () => ProviderRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton<WebClientRepository>(
      () => WebClientRepositoryImpl(datasource: getIt()));

  //! Datasource
  getIt.registerLazySingleton<ProviderDatasource>(
      () => ProviderDatasourceImpl(providerApi: getIt()));
  getIt.registerLazySingleton<WebClientDatasource>(
      () => WebClientDatasourceImpl(webClientApi: getIt()));

  // !Externals
  final dioWebClient = Dio(
    BaseOptions(
      baseUrl: Environment.urlWebClient,
      connectTimeout: const Duration(seconds: 38),
      receiveTimeout: const Duration(seconds: 38),
    ),
  );

  final dioProvider = Dio(
    BaseOptions(
      baseUrl: Environment.urlProvider,
      connectTimeout: const Duration(seconds: 38),
      receiveTimeout: const Duration(seconds: 38),
    ),
  );
  // Services
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(flutterSecureStorageAdapter: getIt()),
  );

  //  Secure storage
  getIt.registerLazySingleton<FlutterSecureStorageAdapter>(() =>
      FlutterSecureStorageAdapter(secureStorage: const FlutterSecureStorage()));

  // !APIS
  getIt.registerLazySingleton<ProviderApi>(
      () => ProviderApi(http: Http(dioProvider)));
  getIt.registerLazySingleton<WebClientApi>(
      () => WebClientApi(http: Http(dioWebClient)));

  //
  // !Global
  getIt.registerSingleton(SessionBloc(
      // netcoreGetTaxUsecase: getIt(),
      // netcoreGetTermsUsecase: getIt(),
      // netcoreGetCitiesUsecase: getIt(),
      ));
}
