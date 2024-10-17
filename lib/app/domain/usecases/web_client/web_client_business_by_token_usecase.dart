import '../../either/either.dart';
import '../../models/business.dart';
import '../../repositories/web_client_repository.dart';

class WebClientBusinessByTokenUsecase {
  WebClientBusinessByTokenUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, Business>> call({required String token}) {
    return _repository.businessByToken(token: token);
  }
}
