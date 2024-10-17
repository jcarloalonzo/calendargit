import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/models/service.dart';

part 'set_services_worker_screen_model.freezed.dart';

@freezed
class SetServicesWorkerScreenModel with _$SetServicesWorkerScreenModel {
  const factory SetServicesWorkerScreenModel({
    required int personId,
    required List<Service> services,
    @Default([]) List<Service> servicesSelected,
  }) = _SetServicesWorkerScreenModel;
}
