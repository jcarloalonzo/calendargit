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
import '../../domain/repositories/web_client_repository.dart';
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

class WebClientRepositoryImpl implements WebClientRepository {
  WebClientRepositoryImpl({required WebClientDatasource datasource})
      : _datasource = datasource;

  //

  final WebClientDatasource _datasource;

  @override
  Future<Either<String, List<Category>>> getCategories() {
    return _datasource.getCategories();
  }

  @override
  Future<Either<String, List<ServicesCategoryResponse>>> servicesByCategories(
      {required List<IdRequest> categoryIds}) {
    return _datasource.servicesByCategories(categoryIds: categoryIds);
  }

  @override
  Future<Either<String, Business>> companyCreate(
      {required CompanyCreateRequest request}) {
    return _datasource.companyCreate(request: request);
  }

  @override
  Future<Either<String, User>> login({required LoginRequest request}) {
    return _datasource.login(request: request);
  }

  @override
  Future<Either<String, int>> createWorker(
      {required CreateWorkerRequest request}) {
    return _datasource.createWorker(request: request);
  }

  @override
  Future<Either<String, List<Service>>> servicesByBusiness(
      {required int businessId}) {
    return _datasource.servicesByBusiness(businessId: businessId);
  }

  @override
  Future<Either<String, bool>> setServicesWorker(
      {required SetServicesWorkerRequest request}) {
    return _datasource.setServicesWorker(request: request);
  }

  @override
  Future<Either<String, List<Worker>>> workersByBusiness(
      {required int businessId, required int personTypeId}) {
    return _datasource.workersByBusiness(
        businessId: businessId, personTypeId: personTypeId);
  }

  @override
  Future<Either<String, List<ServiceWorker>>> detailsServicesWorker(
      {required int businessId, required int personId}) {
    return _datasource.detailsServicesWorker(
        businessId: businessId, personId: personId);
  }

  @override
  Future<Either<String, Business>> businessByToken({required String token}) {
    return _datasource.businessByToken(token: token);
  }

  @override
  Future<Either<String, List<Booking>>> bookingList(
      {required BookingListRequest request}) {
    return _datasource.bookingList(request: request);
  }

  @override
  Future<Either<String, bool>> completeBooking(
      {required CompleteBookingRequest request, required int bookingId}) {
    return _datasource.completeBooking(request: request, bookingId: bookingId);
  }

  @override
  Future<Either<String, bool>> cancelBooking(
      {required CancelBookingRequest request, required int bookingId}) {
    return _datasource.cancelBooking(request: request, bookingId: bookingId);
  }

  @override
  Future<Either<String, bool>> validateReprogramBooking(
      {required int bookingId}) {
    return _datasource.validateReprogramBooking(bookingId: bookingId);
  }

  @override
  Future<Either<String, ProfessionalRangeDateAppointment>>
      rangeDateProfessionalAppointment(
          {required int businessId, required int personId}) {
    return _datasource.rangeDateProfessionalAppointment(
        businessId: businessId, personId: personId);
  }

  @override
  Future<Either<String, List<ProfessionalTurnAppointment>>>
      turnsProfessionalAppointment(
          {required TurnProfessionalAppointmentRequest request}) {
    return _datasource.turnsProfessionalAppointment(request: request);
  }

  @override
  Future<Either<String, bool>> rescheduleBooking(
      {required RescheduleBookingRequest request, required int bookingId}) {
    return _datasource.rescheduleBooking(
        request: request, bookingId: bookingId);
  }
}
