import '../../../data/entities/requests/company_create_request.dart';
import '../../either/either.dart';
import '../../models/business.dart';
import '../../repositories/web_client_repository.dart';

class WebClientCompanyCreateUsecase {
  WebClientCompanyCreateUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, Business>> call(
      {required CompanyCreateRequest request}) {
    return _repository.companyCreate(request: request);
  }
}
