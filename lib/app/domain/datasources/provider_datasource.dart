import '../../data/entities/responses/validate_token_response.dart';
import '../either/either.dart';
import '../models/company.dart';

abstract class ProviderDatasource {
  //
  Future<Either<String, ValidateTokenResponse>> validateToken(
      {required String token});
  Future<Either<String, Company>> companyByToken({required String token});
  Future<Either<String, bool>> sincronizationToken({required String token});

}
