import '../../either/either.dart';
import '../../models/worker.dart';
import '../../repositories/web_client_repository.dart';

class WebClientWorkersUsecase {
  WebClientWorkersUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<Worker>>> call(
      {required int businessId, required int personTypeId}) {
    return _repository.workersByBusiness(
        businessId: businessId, personTypeId: personTypeId);
  }
}
