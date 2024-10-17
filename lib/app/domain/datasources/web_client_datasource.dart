import '../../data/entities/requests/company_create_request.dart';
import '../../data/entities/requests/create_worker_request.dart';
import '../../data/entities/requests/id_request.dart';
import '../../data/entities/requests/login_request.dart';
import '../../data/entities/requests/set_services_worker_request.dart';
import '../../data/entities/responses/services_category_response.dart';
import '../either/either.dart';
import '../models/business.dart';
import '../models/category.dart';
import '../models/service.dart';
import '../models/service_worker.dart';
import '../models/user.dart';
import '../models/worker.dart';

abstract class WebClientDatasource {
  Future<Either<String, List<Category>>> getCategories();
  Future<Either<String, List<ServicesCategoryResponse>>> servicesByCategories(
      {required List<IdRequest> categoryIds});

  Future<Either<String, Business>> companyCreate(
      {required CompanyCreateRequest request});
  Future<Either<String, User>> login({required LoginRequest request});
  Future<Either<String, int>> createWorker(
      {required CreateWorkerRequest request});
  //
  Future<Either<String, List<Service>>> servicesByBusiness(
      {required int businessId});

  Future<Either<String, bool>> setServicesWorker(
      {required SetServicesWorkerRequest request});

  Future<Either<String, List<Worker>>> workersByBusiness(
      {required int businessId, required int personTypeId});
  Future<Either<String, List<ServiceWorker>>> detailsServicesWorker(
      {required int businessId, required int personId});
  Future<Either<String, Business>> businessByToken({required String token});
}
