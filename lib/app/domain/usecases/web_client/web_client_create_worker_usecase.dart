import '../../../data/entities/requests/create_worker_request.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientCreateWorkerUsecase {
  WebClientCreateWorkerUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, int>> call({required CreateWorkerRequest request}) {
    return _repository.createWorker(request: request);
  }
}
