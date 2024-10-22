import '../../domain/datasources/web_client_datasource.dart';
import '../../domain/either/either.dart';
import '../../domain/models/booking.dart';
import '../../domain/models/business.dart';
import '../../domain/models/category.dart';
import '../../domain/models/professional_range_date_appointment.dart';
import '../../domain/models/professional_turn_appointment.dart';
import '../../domain/models/service.dart';
import '../../domain/models/service_worker.dart';
import '../../domain/models/user.dart';
import '../../domain/models/worker.dart';
import '../entities/requests/booking_list_request.dart';
import '../entities/requests/cancel_booking_request.dart';
import '../entities/requests/company_create_request.dart';
import '../entities/requests/complete_booking_request.dart';
import '../entities/requests/create_worker_request.dart';
import '../entities/requests/id_request.dart';
import '../entities/requests/login_request.dart';
import '../entities/requests/reschedule_booking_request.dart';
import '../entities/requests/set_services_worker_request.dart';
import '../entities/requests/turn_professional_appointment_request.dart';
import '../entities/responses/services_category_response.dart';
import '../services/remote/web_client_api.dart';

class WebClientDatasourceImpl implements WebClientDatasource {
  WebClientDatasourceImpl({required WebClientApi webClientApi})
      : _webClientApi = webClientApi;

  final WebClientApi _webClientApi;

  @override
  Future<Either<String, List<Category>>> getCategories() async {
    final response = await _webClientApi.getCategories();
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<ServicesCategoryResponse>>> servicesByCategories(
      {required List<IdRequest> categoryIds}) async {
    final response =
        await _webClientApi.servicesByCategories(categoryIds: categoryIds);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, Business>> companyCreate(
      {required CompanyCreateRequest request}) async {
    final response = await _webClientApi.companyCreate(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, User>> login({required LoginRequest request}) async {
    final response = await _webClientApi.login(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, int>> createWorker(
      {required CreateWorkerRequest request}) async {
    final response = await _webClientApi.createWorker(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<Service>>> servicesByBusiness(
      {required int businessId}) async {
    final response =
        await _webClientApi.servicesByBusiness(businessId: businessId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> setServicesWorker(
      {required SetServicesWorkerRequest request}) async {
    final response = await _webClientApi.setServicesWorker(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<Worker>>> workersByBusiness(
      {required int businessId, required int personTypeId}) async {
    final response = await _webClientApi.workersByBusiness(
        businessId: businessId, personTypeId: personTypeId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<ServiceWorker>>> detailsServicesWorker(
      {required int businessId, required int personId}) async {
    final response = await _webClientApi.detailsServicesWorker(
        businessId: businessId, personId: personId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, Business>> businessByToken(
      {required String token}) async {
    final response = await _webClientApi.businessByToken(token: token);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<Booking>>> bookingList(
      {required BookingListRequest request}) async {
    final response = await _webClientApi.bookingList(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> cancelBooking(
      {required CancelBookingRequest request, required int bookingId}) async {
    final response = await _webClientApi.cancelBooking(
        request: request, bookingId: bookingId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> completeBooking(
      {required CompleteBookingRequest request, required int bookingId}) async {
    final response = await _webClientApi.completeBooking(
        request: request, bookingId: bookingId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> validateReprogramBooking(
      {required int bookingId}) async {
    final response =
        await _webClientApi.validateReprogramBooking(bookingId: bookingId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, ProfessionalRangeDateAppointment>>
      rangeDateProfessionalAppointment(
          {required int businessId, required int personId}) async {
    final response = await _webClientApi.rangeDateProfessionalAppointment(
        businessId: businessId, personId: personId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, List<ProfessionalTurnAppointment>>>
      turnsProfessionalAppointment(
          {required TurnProfessionalAppointmentRequest request}) async {
    final response =
        await _webClientApi.turnsProfessionalAppointment(request: request);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }

  @override
  Future<Either<String, bool>> rescheduleBooking(
      {required RescheduleBookingRequest request,
      required int bookingId}) async {
    final response = await _webClientApi.rescheduleBooking(
        request: request, bookingId: bookingId);
    return response.when(
      left: (failure) {
        return Either.left(failure);
      },
      right: (result) async {
        return Either.right(result);
      },
    );
  }
}
