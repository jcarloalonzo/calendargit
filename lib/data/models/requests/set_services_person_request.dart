// To parse this JSON data, do
//
//     final setServicesPersonRequest = setServicesPersonRequestFromJson(jsonString);

import 'dart:convert';

import 'create_company_request.dart';

class SetServicesPersonRequest {
  SetServicesPersonRequest({
    required this.personId,
    required this.servicesIds,
  });
  factory SetServicesPersonRequest.fromJson(Map<String, dynamic> json) =>
      SetServicesPersonRequest(
        personId: json['personID'],
        servicesIds: json['servicesIds'] == null
            ? []
            : List<EsIdRequest>.from(
                json['servicesIds']!.map((x) => EsIdRequest.fromJson(x))),
      );

  factory SetServicesPersonRequest.fromRawJson(String str) =>
      SetServicesPersonRequest.fromJson(json.decode(str));

  int personId;
  List<EsIdRequest> servicesIds;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'personID': personId,
        'servicesIds': servicesIds == null
            ? []
            : List<dynamic>.from(servicesIds.map((x) => x.toJson())),
      };
}

// class ServicesId {
//   ServicesId({
//     this.id,
//   });
//   factory ServicesId.fromJson(Map<String, dynamic> json) => ServicesId(
//         id: json['ID'],
//       );

//   factory ServicesId.fromRawJson(String str) =>
//       ServicesId.fromJson(json.decode(str));

//   int? id;

//   String toRawJson() => json.encode(toJson());

//   Map<String, dynamic> toJson() => {
//         'ID': id,
//       };
// }
