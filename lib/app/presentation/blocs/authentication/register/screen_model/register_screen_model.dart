import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_screen_model.freezed.dart';

@freezed
class RegisterScreenModel with _$RegisterScreenModel {
  const factory RegisterScreenModel({
    @Default('') String username,
    @Default('') String password,
    //
  }) = _RegisterScreenModel;
}
