import '../../../data/entities/requests/cancel_booking_request.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientCancelBookingUsecase {
  WebClientCancelBookingUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, bool>> call(
      {required CancelBookingRequest request, required int bookingId}) {
    return _repository.cancelBooking(request: request, bookingId: bookingId);
  }
}
