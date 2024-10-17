import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_model.freezed.dart';

@freezed
class LoginScreenModel with _$LoginScreenModel {
  const factory LoginScreenModel({
    @Default('') String username,
    @Default('') String password,
  }) = _LoginScreenModel;
}
