import '../../domain/datasources/provider_datasource.dart';
import '../../domain/either/either.dart';
import '../../domain/models/company.dart';
import '../entities/responses/validate_token_response.dart';
import '../services/remote/provider_api.dart';

class ProviderDatasourceImpl implements ProviderDatasource {
  ProviderDatasourceImpl({required ProviderApi providerApi})
      : _providerApi = providerApi;

  final ProviderApi _providerApi;

  @override
  Future<Either<String, ValidateTokenResponse>> validateToken(
      {required String token}) async {
    final response = await _providerApi.validateToken(token: token);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, Company>> companyByToken(
      {required String token}) async {
    final response = await _providerApi.companyByToken(token: token);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> sincronizationToken(
      {required String token}) async {
    final response = await _providerApi.sincronizationToken(token: token);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }
}
