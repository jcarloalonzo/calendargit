import '../../../data/entities/requests/complete_booking_request.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientCompleteBookingUsecase {
  WebClientCompleteBookingUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, bool>> call(
      {required CompleteBookingRequest request, required int bookingId}) {
    return _repository.completeBooking(request: request, bookingId: bookingId);
  }
}
