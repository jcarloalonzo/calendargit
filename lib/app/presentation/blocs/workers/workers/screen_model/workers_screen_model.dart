import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/worker.dart';

part 'workers_screen_model.freezed.dart';

@freezed
class WorkersScreenModel with _$WorkersScreenModel {
  factory WorkersScreenModel({
    required List<Worker> workers,
  }) = _WorkersScreenModel;
}
