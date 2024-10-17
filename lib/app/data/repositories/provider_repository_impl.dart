import '../../domain/datasources/provider_datasource.dart';
import '../../domain/either/either.dart';
import '../../domain/models/company.dart';
import '../../domain/repositories/provider_repository.dart';
import '../entities/responses/validate_token_response.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  ProviderRepositoryImpl({required ProviderDatasource datasource})
      : _datasource = datasource;

  //
  final ProviderDatasource _datasource;

  @override
  Future<Either<String, ValidateTokenResponse>> validateToken(
      {required String token}) {
    return _datasource.validateToken(token: token);
  }

  @override
  Future<Either<String, Company>> companyByToken({required String token}) {
    return _datasource.companyByToken(token: token);
  }

  @override
  Future<Either<String, bool>> sincronizationToken({required String token}) {
    return _datasource.sincronizationToken(token: token);
  }
}
