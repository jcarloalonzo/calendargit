import '../../data/entities/requests/booking_list_request.dart';
import '../../data/entities/requests/cancel_booking_request.dart';
import '../../data/entities/requests/company_create_request.dart';
import '../../data/entities/requests/complete_booking_request.dart';
import '../../data/entities/requests/create_worker_request.dart';
import '../../data/entities/requests/generate_invoice_request.dart';
import '../../data/entities/requests/id_request.dart';
import '../../data/entities/requests/login_request.dart';
import '../../data/entities/requests/reschedule_booking_request.dart';
import '../../data/entities/requests/set_services_worker_request.dart';
import '../../data/entities/requests/turn_professional_appointment_request.dart';
import '../../data/entities/responses/generate_invoice_response.dart';
import '../../data/entities/responses/services_category_response.dart';
import '../either/either.dart';
import '../models/booking.dart';
import '../models/business.dart';
import '../models/category.dart';
import '../models/professional_range_date_appointment.dart';
import '../models/professional_turn_appointment.dart';
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
  Future<Either<String, List<Booking>>> bookingList(
      {required BookingListRequest request});
  Future<Either<String, bool>> cancelBooking(
      {required CancelBookingRequest request, required int bookingId});
  Future<Either<String, bool>> completeBooking(
      {required CompleteBookingRequest request, required int bookingId});
  Future<Either<String, bool>> validateReprogramBooking(
      {required int bookingId});

  Future<Either<String, List<ProfessionalTurnAppointment>>>
      turnsProfessionalAppointment(
          {required TurnProfessionalAppointmentRequest request});

  Future<Either<String, ProfessionalRangeDateAppointment>>
      rangeDateProfessionalAppointment(
          {required int businessId, required int personId});
  Future<Either<String, bool>> rescheduleBooking(
      {required RescheduleBookingRequest request, required int bookingId});

  Future<Either<String, GenerateInvoiceResponse>> generateInvoice(
      {required int bookingId, required GenerateInvoiceRequest request});
}
