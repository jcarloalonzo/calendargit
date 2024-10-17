import '../../either/either.dart';
import '../../repositories/provider_repository.dart';

class ProviderSincronizationTokenUsecase {
  ProviderSincronizationTokenUsecase({required ProviderRepository repository})
     : _repository = repository;
  
  final ProviderRepository _repository;
  Future<Either<String, bool>> call({required String token}) {
    return _repository.sincronizationToken(token:token);
  }
}