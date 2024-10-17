import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/service_worker.dart';
import '../../../../../domain/models/worker.dart';

part 'worker_detail_screen_model.freezed.dart';

@freezed
class WorkerDetailScreenModel with _$WorkerDetailScreenModel {
  factory WorkerDetailScreenModel({
    required Worker worker,
    required List<ServiceWorker> services,
  }) = _WorkerDetailScreenModel;
}
