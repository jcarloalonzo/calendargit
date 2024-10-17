import '../../either/either.dart';
import '../../models/service.dart';
import '../../repositories/web_client_repository.dart';

class WebClientServicesByBusinessUsecase {
  WebClientServicesByBusinessUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<Service>>> call({required int businessId}) {
    return _repository.servicesByBusiness(businessId: businessId);
  }
}
