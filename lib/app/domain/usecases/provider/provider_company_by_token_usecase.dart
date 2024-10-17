import '../../either/either.dart';
import '../../models/company.dart';
import '../../repositories/provider_repository.dart';

class ProviderCompanyByTokenUsecase {
  ProviderCompanyByTokenUsecase({required ProviderRepository repository})
      : _repository = repository;

  final ProviderRepository _repository;
  Future<Either<String, Company>> call({required String token}) {
    return _repository.companyByToken(token: token);
  }
}
