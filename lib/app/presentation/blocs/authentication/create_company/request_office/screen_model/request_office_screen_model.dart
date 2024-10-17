import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_office_screen_model.freezed.dart';

@freezed
class RequestOfficeScreenModel with _$RequestOfficeScreenModel {
  const factory RequestOfficeScreenModel({
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
    @Default('') String officeName,
    @Default('') String officeAddess,
    @Default('') String officePhone,
  }) = _RequestOfficeScreenModel;
}
