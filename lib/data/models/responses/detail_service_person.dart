// To parse this JSON data, do
//
//     final detailServicePerson = detailServicePersonFromJson(jsonString);

import 'dart:convert';

List<DetailServicePerson> detailServicePersonFromJson(String str) =>
    List<DetailServicePerson>.from(
        json.decode(str).map((x) => DetailServicePerson.fromJson(x)));

String detailServicePersonToJson(List<DetailServicePerson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailServicePerson {
  DetailServicePerson({
    this.serviceId,
    this.serviceCode,
    this.description,
    this.shortDescription,
  });
  factory DetailServicePerson.fromJson(Map<String, dynamic> json) =>
      DetailServicePerson(
        serviceId: json['serviceID'],
        serviceCode: json['serviceCode'],
        description: json['description'],
        shortDescription: json['shortDescription'],
      );

  int? serviceId;
  String? serviceCode;
  String? description;
  String? shortDescription;

  Map<String, dynamic> toJson() => {
        'serviceID': serviceId,
        'serviceCode': serviceCode,
        'description': description,
        'shortDescription': shortDescription,
      };
}
