import '../../../../config/helpers/helpers.dart';
import '../../../domain/either/either.dart';
import '../../../domain/models/booking.dart';
import '../../../domain/models/business.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/professional_range_date_appointment.dart';
import '../../../domain/models/professional_turn_appointment.dart';
import '../../../domain/models/service.dart';
import '../../../domain/models/service_worker.dart';
import '../../../domain/models/user.dart';
import '../../../domain/models/worker.dart';
import '../../entities/requests/booking_list_request.dart';
import '../../entities/requests/cancel_booking_request.dart';
import '../../entities/requests/company_create_request.dart';
import '../../entities/requests/complete_booking_request.dart';
import '../../entities/requests/create_worker_request.dart';
import '../../entities/requests/generate_invoice_request.dart';
import '../../entities/requests/id_request.dart';
import '../../entities/requests/login_request.dart';
import '../../entities/requests/reschedule_booking_request.dart';
import '../../entities/requests/set_services_worker_request.dart';
import '../../entities/requests/turn_professional_appointment_request.dart';
import '../../entities/responses/generate_invoice_response.dart';
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

  Future<Either<String, List<Booking>>> bookingList(
      {required BookingListRequest request}) async {
    final response = await _http.request(
      '/v1/booking/getBookingList/${request.businessId}?personID=${request.personId}&InitialDate=${Helpers.formatDate(request.initialDate)}&FinalDate=${Helpers.formatDate(request.finalDate)}&BookingStateID=${request.bookingStateId}',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list.map((e) => Booking.fromJson(e)).toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, bool>> cancelBooking(
      {required CancelBookingRequest request, required int bookingId}) async {
    final response = await _http.request(
      '/v1/booking/anulate/$bookingId',
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

  Future<Either<String, bool>> completeBooking(
      {required CompleteBookingRequest request, required int bookingId}) async {
    final response = await _http.request(
      '/v1/booking/confirm/$bookingId',
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

  Future<Either<String, bool>> validateReprogramBooking(
      {required int bookingId}) async {
    final response = await _http.request(
      '/v1/booking/validateToReprogram/$bookingId',
      method: HttpMethod.post,
      bodyRequest: {},
      onSuccess: (json) {
        return json as bool;
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, List<ProfessionalTurnAppointment>>>
      turnsProfessionalAppointment(
          {required TurnProfessionalAppointmentRequest request}) async {
    final response = await _http.request(
      '/program/getTurn/personID/${request.personId}/serviceID/${request.serviceId}/dateProgram/${Helpers.formatDate(request.date)}',
      method: HttpMethod.get,
      onSuccess: (json) {
        final list = json as List;
        return list
            .map((e) => ProfessionalTurnAppointment.fromJson(e))
            .toList();
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, ProfessionalRangeDateAppointment>>
      rangeDateProfessionalAppointment(
          {required int businessId, required int personId}) async {
    final response = await _http.request(
      '/program/getRangeDate/personID?personID=$personId&BusinessID=$businessId',
      method: HttpMethod.get,
      onSuccess: (json) {
        return ProfessionalRangeDateAppointment.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }

  Future<Either<String, bool>> rescheduleBooking(
      {required RescheduleBookingRequest request,
      required int bookingId}) async {
    final response = await _http.request(
      '/v1/booking/reprogram/$bookingId',
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

  Future<Either<String, GenerateInvoiceResponse>> generateInvoice(
      {required int bookingId, required GenerateInvoiceRequest request}) async {
    final response = await _http.request(
      '/v1/booking/invoice/$bookingId',
      method: HttpMethod.post,
      bodyRequest: request.toJson(),
      onSuccess: (json) {
        return GenerateInvoiceResponse.fromJson(json);
      },
    );
    return response.when(
      left: (failure) => Either.left(failure),
      right: (value) => Either.right(value),
    );
  }
}
