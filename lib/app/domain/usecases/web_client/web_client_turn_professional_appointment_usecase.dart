import '../../../data/entities/requests/turn_professional_appointment_request.dart';
import '../../either/either.dart';
import '../../models/professional_turn_appointment.dart';
import '../../repositories/web_client_repository.dart';

class WebClientTurnProfessionalAppointmentUsecase {
  WebClientTurnProfessionalAppointmentUsecase(
      {required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<ProfessionalTurnAppointment>>> call(
      {required TurnProfessionalAppointmentRequest request}) {
    return _repository.turnsProfessionalAppointment(request: request);
  }
}
