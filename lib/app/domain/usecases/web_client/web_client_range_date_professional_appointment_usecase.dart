import '../../either/either.dart';
import '../../models/professional_range_date_appointment.dart';
import '../../repositories/web_client_repository.dart';

class WebClientRangeDateProfessionalAppointmentUsecase {
  WebClientRangeDateProfessionalAppointmentUsecase(
      {required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, ProfessionalRangeDateAppointment>> call(
      {required int businessId, required int personId}) {
    return _repository.rangeDateProfessionalAppointment(
        businessId: businessId, personId: personId);
  }
}
