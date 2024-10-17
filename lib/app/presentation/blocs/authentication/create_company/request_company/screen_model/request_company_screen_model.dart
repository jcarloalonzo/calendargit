import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_company_screen_model.freezed.dart';

@freezed
class RequestCompanyScreenModel with _$RequestCompanyScreenModel {
  const factory RequestCompanyScreenModel({
    required String identification,
    required String codeUID,
    required String officeAddress,
    required String officePhone,
    @Default('') String companyName,
    @Default('') String legalName,
    @Default('') String website,
    @Default('') String companyPhone,
    @Default('') String contactEmail,
    @Default('') String contactPhone,
    @Default('') String contactName,
  }) = _RequestCompanyScreenModel;
}
