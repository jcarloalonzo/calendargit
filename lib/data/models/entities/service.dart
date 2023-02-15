// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

List<Service> serviceFromJson(String str) =>
    List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
  Service({
    this.serviceId,
    this.serviceCode,
    this.description,
    this.shortDescription,
    this.time,
  });

  int? serviceId;
  String? serviceCode;
  String? description;
  String? shortDescription;
  String? time;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json["serviceID"],
        serviceCode: json["serviceCode"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "serviceID": serviceId,
        "serviceCode": serviceCode,
        "description": description,
        "shortDescription": shortDescription,
        "time": time,
      };
}
