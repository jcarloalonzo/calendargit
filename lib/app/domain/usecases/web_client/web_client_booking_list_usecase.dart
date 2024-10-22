import '../../../data/entities/requests/booking_list_request.dart';
import '../../either/either.dart';
import '../../models/booking.dart';
import '../../repositories/web_client_repository.dart';

class WebClientBookingListUsecase {
  WebClientBookingListUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<Booking>>> call(
      {required BookingListRequest request}) {
    return _repository.bookingList(request: request);
  }
}
