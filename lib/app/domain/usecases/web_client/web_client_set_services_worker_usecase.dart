import '../../../data/entities/requests/set_services_worker_request.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientSetServicesWorkerUsecase {
  WebClientSetServicesWorkerUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, bool>> call(
      {required SetServicesWorkerRequest request}) {
    return _repository.setServicesWorker(request: request);
  }
}
