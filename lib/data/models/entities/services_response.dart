// To parse this JSON data, do
//
//     final servicesResponse = servicesResponseFromJson(jsonString);

import 'dart:convert';

class ServicesResponse {
  ServicesResponse({
    required this.serviceId,
    required this.categoryId,
    required this.descriptionCategory,
    required this.serviceCode,
    required this.description,
    required this.shortDescription,
    this.uImage,
    this.observation,
    required this.activate,
    required this.online,
    required this.time,
    required this.registerDate,
    required this.registerUsr,
  });
  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      ServicesResponse(
        serviceId: json['serviceID'],
        categoryId: json['categoryID'],
        descriptionCategory: json['descriptionCategory'],
        serviceCode: json['serviceCode'],
        description: json['description'],
        shortDescription: json['shortDescription'],
        uImage: json['uImage'],
        observation: json['observation'],
        activate: json['activate'],
        online: json['online'],
        time: json['time'],
        registerDate: json['registerDate'],
        registerUsr: json['registerUsr'],
      );

  factory ServicesResponse.fromRawJson(String str) =>
      ServicesResponse.fromJson(json.decode(str));

  int serviceId;
  int categoryId;
  String descriptionCategory;
  String serviceCode;
  String description;
  String shortDescription;
  dynamic uImage;
  dynamic observation;
  bool activate;
  bool online;
  String time;
  String registerDate;
  int registerUsr;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'serviceID': serviceId,
        'categoryID': categoryId,
        'descriptionCategory': descriptionCategory,
        'serviceCode': serviceCode,
        'description': description,
        'shortDescription': shortDescription,
        'uImage': uImage,
        'observation': observation,
        'activate': activate,
        'online': online,
        'time': time,
        'registerDate': registerDate,
        'registerUsr': registerUsr,
      };
}
