import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientValidateReprogramBookingUsecase {
  WebClientValidateReprogramBookingUsecase(
      {required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, bool>> call({required int bookingId}) {
    return _repository.validateReprogramBooking(bookingId: bookingId);
  }
}
