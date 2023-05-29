// To parse this JSON data, do
//
//     final serviceBusinessResponse = serviceBusinessResponseFromJson(jsonString);

import 'dart:convert';

class ServiceBusinessResponse {
  ServiceBusinessResponse({
    required this.serviceId,
    required this.categoryId,
    this.categoryDescription,
    this.description,
    this.shortDescription,
    this.observation,
    this.imageUrl,
    this.timeService,
    this.observationTemplate,
    this.imageTemplate,
    this.timeTemplate,
  });
  factory ServiceBusinessResponse.fromJson(Map<String, dynamic> json) =>
      ServiceBusinessResponse(
        serviceId: json['serviceID'],
        categoryId: json['categoryID'],
        categoryDescription: json['categoryDescription'],
        description: json['description'],
        shortDescription: json['shortDescription'],
        observation: json['observation'],
        imageUrl: json['imageUrl'],
        timeService: json['timeService'],
        observationTemplate: json['observationTemplate'],
        imageTemplate: json['imageTemplate'],
        timeTemplate: json['timeTemplate'],
      );

  factory ServiceBusinessResponse.fromRawJson(String str) =>
      ServiceBusinessResponse.fromJson(json.decode(str));

  int serviceId;
  int categoryId;
  String? categoryDescription;
  String? description;
  String? shortDescription;
  String? observation;
  String? imageUrl;
  String? timeService;
  String? observationTemplate;
  String? imageTemplate;
  String? timeTemplate;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'serviceID': serviceId,
        'categoryID': categoryId,
        'categoryDescription': categoryDescription,
        'description': description,
        'shortDescription': shortDescription,
        'observation': observation,
        'imageUrl': imageUrl,
        'timeService': timeService,
        'observationTemplate': observationTemplate,
        'imageTemplate': imageTemplate,
        'timeTemplate': timeTemplate,
      };
}
