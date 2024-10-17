import '../../either/either.dart';
import '../../models/service_worker.dart';
import '../../repositories/web_client_repository.dart';

class WebClientDetailsServicesWorkerUsecase {
  WebClientDetailsServicesWorkerUsecase({required WebClientRepository repository})
     : _repository = repository;
  
  final WebClientRepository _repository;
  Future<Either<String, List<ServiceWorker>>> call( {required int businessId, required int personId}) {
    return _repository.detailsServicesWorker(businessId: businessId, personId: personId);
  }
}