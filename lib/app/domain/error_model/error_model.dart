import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/app_config/enums.dart';

part 'error_model.freezed.dart';

@freezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    required String message,
    @Default(DialogType.warning) DialogType dialogType,
  }) = _ErrorModel;
}
