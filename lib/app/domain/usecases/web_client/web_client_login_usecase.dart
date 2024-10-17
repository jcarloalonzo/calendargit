import '../../../data/entities/requests/login_request.dart';
import '../../either/either.dart';
import '../../models/user.dart';
import '../../repositories/web_client_repository.dart';

class WebClientLoginUsecase {
  WebClientLoginUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, User>> call({required LoginRequest request}) {
    return _repository.login(request: request);
  }
}
