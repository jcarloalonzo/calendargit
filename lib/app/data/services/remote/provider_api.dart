import '../../../domain/either/either.dart';
import '../../../domain/models/company.dart';
import '../../entities/responses/validate_token_response.dart';
import '../../http/http.dart';

class ProviderApi {
  ProviderApi({required Http http}) : _http = http;

  final Http _http;

  Future<Either<String, ValidateTokenResponse>> validateToken(
      {required String token}) async {
    final response = await _http.request(
      '/Company/ValidateToken?token=$token',
      method: HttpMethod.get,
      onSuccess: (json) {
        return ValidateTokenResponse.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, Company>> companyByToken(
      {required String token}) async {
    final response = await _http.request(
      '/Company/GetCompanyByToken?token=$token',
      method: HttpMethod.get,
      onSuccess: (json) {
        return Company.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, bool>> sincronizationToken(
      {required String token}) async {
    final response = await _http.request(
      '/Company/sincronizationToken?token=$token',
      method: HttpMethod.get,
      onSuccess: (json) {
        return json as bool;
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }
}
