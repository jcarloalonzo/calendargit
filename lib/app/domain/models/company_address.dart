import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_address.freezed.dart';
part 'company_address.g.dart';

@freezed
class CompanyAddress with _$CompanyAddress {
  const factory CompanyAddress({
    @JsonKey(name: 'CompanyAdressID') required int companyAdressId,
    @JsonKey(name: 'Country') required String country,
    @JsonKey(name: 'CountrySub') required String countrySub,
    @JsonKey(name: 'CountrySubName') required String countrySubName,
    @JsonKey(name: 'CountryCon') required String countryCon,
    @JsonKey(name: 'CountryConName') required String countryConName,
    @JsonKey(name: 'CountryMun') required String countryMun,
    @JsonKey(name: 'CountryMunName') required String countryMunName,
    @JsonKey(name: 'Adress') required String adress,
    @JsonKey(name: 'MapAdress') required String mapAdress,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'Telephone') required String telephone,
    @JsonKey(name: 'Zipcode') required String zipcode,
    @JsonKey(name: 'Activate') required bool activate,
  }) = _CompanyAddress;

  factory CompanyAddress.fromJson(Map<String, dynamic> json) =>
      _$CompanyAddressFromJson(json);
}
