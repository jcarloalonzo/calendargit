// To parse this JSON data, do
//
//     final companyByTokenResponse = companyByTokenResponseFromJson(jsonString);

import 'dart:convert';

class CompanyByTokenResponse {
  CompanyByTokenResponse({
    required this.companyId,
    required this.businessId,
    required this.businessName,
    this.emailAddress,
    this.phoneNumber,
    required this.typeCustomerId,
    this.identification,
    this.name,
    this.lastName,
    this.codeUid,
    this.companyName,
    this.webSite,
    required this.client,
    required this.provider,
    required this.automatic,
    required this.taxLiable,
    this.codeIc,
    required this.state,
    required this.allowLicense,
    this.companyAddress = const [],
    this.companyContact = const [],
  });
  factory CompanyByTokenResponse.fromJson(Map<String, dynamic> json) =>
      CompanyByTokenResponse(
        companyId: json['CompanyID'],
        businessId: json['BusinessID'],
        businessName: json['BusinessName'],
        emailAddress: json['EmailAddress'],
        phoneNumber: json['PhoneNumber'],
        typeCustomerId: json['TypeCustomerID'],
        identification: json['Identification'],
        name: json['Name'],
        lastName: json['LastName'],
        codeUid: json['CodeUID'],
        companyName: json['CompanyName'],
        webSite: json['WebSite'],
        client: json['Client'],
        provider: json['Provider'],
        automatic: json['Automatic'],
        taxLiable: json['TaxLiable'],
        codeIc: json['CodeIC'],
        state: json['state'],
        allowLicense: json['AllowLicense'],
        companyAddress: json['CompanyAddress'] == null
            ? []
            : List<CompanyAddress>.from(
                json['CompanyAddress']!.map((x) => CompanyAddress.fromJson(x))),
        companyContact: json['CompanyContact'] == null
            ? []
            : List<CompanyContact>.from(
                json['CompanyContact']!.map((x) => CompanyContact.fromJson(x))),
      );

  static CompanyByTokenResponse companyByTokenResponseFromJson(String str) =>
      CompanyByTokenResponse.fromJson(json.decode(str));

  static String companyByTokenResponseToJson(CompanyByTokenResponse data) =>
      json.encode(data.toJson());

  int companyId;
  int businessId;
  String businessName;
  String? emailAddress;
  String? phoneNumber;
  int typeCustomerId;
  String? identification;
  String? name;
  String? lastName;
  String? codeUid;
  String? companyName;
  String? webSite;
  bool client;
  bool provider;
  bool automatic;
  bool taxLiable;
  String? codeIc;
  bool state;
  bool allowLicense;
  List<CompanyAddress> companyAddress;
  List<CompanyContact> companyContact;

  Map<String, dynamic> toJson() => {
        'CompanyID': companyId,
        'BusinessID': businessId,
        'BusinessName': businessName,
        'EmailAddress': emailAddress,
        'PhoneNumber': phoneNumber,
        'TypeCustomerID': typeCustomerId,
        'Identification': identification,
        'Name': name,
        'LastName': lastName,
        'CodeUID': codeUid,
        'CompanyName': companyName,
        'WebSite': webSite,
        'Client': client,
        'Provider': provider,
        'Automatic': automatic,
        'TaxLiable': taxLiable,
        'CodeIC': codeIc,
        'state': state,
        'AllowLicense': allowLicense,
        'CompanyAddress': companyAddress == null
            ? []
            : List<dynamic>.from(companyAddress.map((x) => x.toJson())),
        'CompanyContact': companyContact == null
            ? []
            : List<dynamic>.from(companyContact.map((x) => x.toJson())),
      };
}

class CompanyAddress {
  CompanyAddress({
    this.companyAdressId,
    this.country,
    this.countrySub,
    this.countrySubName,
    this.countryCon,
    this.countryConName,
    this.countryMun,
    this.countryMunName,
    this.adress,
    this.mapAdress,
    this.type,
    this.telephone,
    this.zipcode,
    this.activate,
  });
  factory CompanyAddress.fromJson(Map<String, dynamic> json) => CompanyAddress(
        companyAdressId: json['CompanyAdressID'],
        country: json['Country'],
        countrySub: json['CountrySub'],
        countrySubName: json['CountrySubName'],
        countryCon: json['CountryCon'],
        countryConName: json['CountryConName'],
        countryMun: json['CountryMun'],
        countryMunName: json['CountryMunName'],
        adress: json['Adress'],
        mapAdress: json['MapAdress'],
        type: json['Type'],
        telephone: json['Telephone'],
        zipcode: json['Zipcode'],
        activate: json['Activate'],
      );

  int? companyAdressId;
  String? country;
  String? countrySub;
  String? countrySubName;
  String? countryCon;
  String? countryConName;
  String? countryMun;
  String? countryMunName;
  String? adress;
  String? mapAdress;
  int? type;
  String? telephone;
  String? zipcode;
  bool? activate;

  Map<String, dynamic> toJson() => {
        'CompanyAdressID': companyAdressId,
        'Country': country,
        'CountrySub': countrySub,
        'CountrySubName': countrySubName,
        'CountryCon': countryCon,
        'CountryConName': countryConName,
        'CountryMun': countryMun,
        'CountryMunName': countryMunName,
        'Adress': adress,
        'MapAdress': mapAdress,
        'Type': type,
        'Telephone': telephone,
        'Zipcode': zipcode,
        'Activate': activate,
      };
}

class CompanyContact {
  CompanyContact({
    this.companyContactId,
    this.documentTypeId,
    this.documentNumber,
    this.name,
    this.surname,
    this.secondSurname,
    this.phoneNumber,
    this.emailAdress,
    this.activate,
  });
  factory CompanyContact.fromJson(Map<String, dynamic> json) => CompanyContact(
        companyContactId: json['CompanyContactID'],
        documentTypeId: json['DocumentTypeID'],
        documentNumber: json['DocumentNumber'],
        name: json['Name'],
        surname: json['Surname'],
        secondSurname: json['SecondSurname'],
        phoneNumber: json['PhoneNumber'],
        emailAdress: json['EmailAdress'],
        activate: json['Activate'],
      );

  int? companyContactId;
  String? documentTypeId;
  String? documentNumber;
  String? name;
  String? surname;
  String? secondSurname;
  String? phoneNumber;
  String? emailAdress;
  bool? activate;

  Map<String, dynamic> toJson() => {
        'CompanyContactID': companyContactId,
        'DocumentTypeID': documentTypeId,
        'DocumentNumber': documentNumber,
        'Name': name,
        'Surname': surname,
        'SecondSurname': secondSurname,
        'PhoneNumber': phoneNumber,
        'EmailAdress': emailAdress,
        'Activate': activate,
      };
}
