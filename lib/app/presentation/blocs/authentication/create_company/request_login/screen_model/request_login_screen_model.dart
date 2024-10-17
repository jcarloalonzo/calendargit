import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_login_screen_model.freezed.dart';

@freezed
class RequestLoginScreenModel with _$RequestLoginScreenModel {
  const factory RequestLoginScreenModel({
    required String identification,
    required String codeUID,
    required String companyName,
    required String legalName,
    required String website,
    required String companyPhone,
    required String contactEmail,
    required String contactPhone,
    required String contactName,
    //
    required String officeName,
    required String officeAddess,
    required String officePhone,
    @Default('') String username,
    @Default('') String password,
  }) = _RequestLoginScreenModel;
}
