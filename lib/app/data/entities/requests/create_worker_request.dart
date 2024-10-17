import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_worker_request.freezed.dart';
part 'create_worker_request.g.dart';

@freezed
class CreateWorkerRequest with _$CreateWorkerRequest {
  const factory CreateWorkerRequest({
    @JsonKey(name: 'businessID') required int businessId,
    @JsonKey(name: 'personTypeID') required int personTypeId,
    @JsonKey(name: 'documentNumber') required String documentNumber,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'surname') required String surname,
    @JsonKey(name: 'secondSurname') required String secondSurname,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    @JsonKey(name: 'emailAddress') required String emailAddress,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'officeID') required int officeId,
    @JsonKey(name: 'user') required String user,
    @JsonKey(name: 'password') required String password,
  }) = _CreateWorkerRequest;

  factory CreateWorkerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkerRequestFromJson(json);
}
