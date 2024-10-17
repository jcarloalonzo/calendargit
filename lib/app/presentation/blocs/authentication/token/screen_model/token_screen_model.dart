import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_screen_model.freezed.dart';

@freezed
class TokenScreenModel with _$TokenScreenModel {
  const factory TokenScreenModel({
    @Default('') String code,
  }) = _TokenScreenModel;
}
