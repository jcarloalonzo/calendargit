import '../../../data/entities/responses/validate_token_response.dart';
import '../../either/either.dart';
import '../../repositories/provider_repository.dart';

class ProviderValidateTokenUsecase {
  ProviderValidateTokenUsecase({required ProviderRepository repository})
      : _repository = repository;

  final ProviderRepository _repository;
  Future<Either<String, ValidateTokenResponse>> call({required String token}) {
    return _repository.validateToken(token: token);
  }
}
