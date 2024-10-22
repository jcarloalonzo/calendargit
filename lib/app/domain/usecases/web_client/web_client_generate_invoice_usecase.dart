import '../../../data/entities/requests/generate_invoice_request.dart';
import '../../../data/entities/responses/generate_invoice_response.dart';
import '../../either/either.dart';
import '../../repositories/web_client_repository.dart';

class WebClientGenerateInvoiceUsecase {
  WebClientGenerateInvoiceUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, GenerateInvoiceResponse>> call(
      {required int bookingId, required GenerateInvoiceRequest request}) {
    return _repository.generateInvoice(bookingId: bookingId, request: request);
  }
}
