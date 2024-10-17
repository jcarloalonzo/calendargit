import '../../../domain/either/either.dart';
import '../../../domain/models/business.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/service.dart';
import '../../../domain/models/service_worker.dart';
import '../../../domain/models/user.dart';
import '../../../domain/models/worker.dart';
import '../../entities/requests/company_create_request.dart';
import '../../entities/requests/create_worker_request.dart';
import '../../entities/requests/id_request.dart';
import '../../entities/requests/login_request.dart';
import '../../entities/requests/set_services_worker_request.dart';
import '../../entities/responses/services_category_response.dart';
import '../../http/http.dart';
import '../../mappers/id_requests_mappers.dart';

class WebClientApi {
  WebClientApi({required Http http}) : _http = http;

  final Http _http;
  Future<Either<String, List<Category>>> getCategories() async {
    final response = await _http.request(
      '/category/getAll',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => Category.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, List<ServicesCategoryResponse>>> servicesByCategories(
      {required List<IdRequest> categoryIds}) async {
    // List<Map<String, dynamic>> jsonList =
    // categoryIds.map((idRequest) => idRequest.toJson()).toList();
    final response = await _http.requestJsonEncode(
      '/service/GetServiceByCategories',
      method: HttpMethod.post,
      // bodyRequest: jsonEncode(jsonList),
      bodyRequest: IdRequestsMappers.toJson(categoryIds),
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => ServicesCategoryResponse.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, Business>> companyCreate(
      {required CompanyCreateRequest request}) async {
    final response = await _http.request(
      '/business/create',
      method: HttpMethod.post,
      bodyRequest: request.toJson(),
      onSuccess: (json) {
        return Business.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, User>> login({required LoginRequest request}) async {
    final response = await _http.request(
      '/User/ValidateLogin',
      method: HttpMethod.post,
      bodyRequest: request.toJson(),
      onSuccess: (json) {
        return User.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, int>> createWorker(
      {required CreateWorkerRequest request}) async {
    final response = await _http.request(
      '/person/addPerson',
      method: HttpMethod.post,
      bodyRequest: request.toJson(),
      onSuccess: (json) {
        return json as int;
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, List<Service>>> servicesByBusiness(
      {required int businessId}) async {
    final response = await _http.request(
      '/service/GetServicesByBusiness?businessID=$businessId',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => Service.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, bool>> setServicesWorker(
      {required SetServicesWorkerRequest request}) async {
    final response = await _http.request(
      '/person/setServicesPerson',
      method: HttpMethod.post,
      bodyRequest: request.toJson(),
      onSuccess: (json) {
        return json as bool;
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, List<Worker>>> workersByBusiness(
      {required int businessId, required int personTypeId}) async {
    final response = await _http.request(
      '/person/getByBusiness/$businessId/$personTypeId',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => Worker.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, List<ServiceWorker>>> detailsServicesWorker(
      {required int businessId, required int personId}) async {
    final response = await _http.request(
      '/person/getDetailService/personID?BusinessID=$businessId&PersonID=$personId',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => ServiceWorker.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, Business>> businessByToken(
      {required String token}) async {
    final response = await _http.request(
      '/business/BusinessByToken?token=$token',
      method: HttpMethod.get,
      onSuccess: (json) {
        return Business.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }
}
