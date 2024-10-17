import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_worker_step_one_screen_model.freezed.dart';

@freezed
class NewWorkerStepOneScreenModel with _$NewWorkerStepOneScreenModel {
  const factory NewWorkerStepOneScreenModel({
    @Default('') String documentNumber,
    @Default('') String name,
    @Default('') String surname,
    @Default('') String phone,
    @Default('') String email,
  }) = _NewWorkerStepOneScreenModel;
}
