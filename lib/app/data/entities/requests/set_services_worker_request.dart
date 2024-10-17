import 'package:freezed_annotation/freezed_annotation.dart';

import 'id_request.dart';

part 'set_services_worker_request.freezed.dart';
part 'set_services_worker_request.g.dart';

@freezed
class SetServicesWorkerRequest with _$SetServicesWorkerRequest {
  const factory SetServicesWorkerRequest({
    @JsonKey(name: 'personID') required int personId,
    @JsonKey(name: 'servicesIds') required List<IdRequest> servicesIds,
  }) = _SetServicesWorkerRequest;

  factory SetServicesWorkerRequest.fromJson(Map<String, dynamic> json) =>
      _$SetServicesWorkerRequestFromJson(json);
}
