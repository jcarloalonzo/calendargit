import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_token_response.freezed.dart';
part 'validate_token_response.g.dart';

@freezed
class ValidateTokenResponse with _$ValidateTokenResponse {
  const factory ValidateTokenResponse({
    @JsonKey(name: 'CompanyID') required int companyId,
    @JsonKey(name: 'CompanyName') required String companyName,
    @JsonKey(name: 'CodeUID') required String codeUid,
    @JsonKey(name: 'AllowLicense') required bool allowLicense,
    @JsonKey(name: 'IsRegister') required bool isRegister,
  }) = _ValidateTokenResponse;

  factory ValidateTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateTokenResponseFromJson(json);
}
