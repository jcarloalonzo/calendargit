import '../../../data/entities/requests/reschedule_booking_request.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientRescheduleBookingUsecase {
  WebClientRescheduleBookingUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, bool>> call(
      {required RescheduleBookingRequest request, required int bookingId}) {
    return _repository.rescheduleBooking(
        request: request, bookingId: bookingId);
  }
}
