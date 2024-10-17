import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_worker_step_two_screen_model.freezed.dart';

@freezed
class NewWorkerStepTwoScreenModel with _$NewWorkerStepTwoScreenModel {
  const factory NewWorkerStepTwoScreenModel({
    required String documentNumber,
    required String name,
    required String surname,
    required String phone,
    required String email,
    @Default('') String username,
    @Default('') String password,
  }) = _NewWorkerStepTwoScreenModel;
}
