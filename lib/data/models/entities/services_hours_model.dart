// To parse this JSON data, do
//
//     final personRangeDate = personRangeDateFromJson(jsonString);

import 'dart:convert';

PersonRangeDateModel personRangeDateFromJson(String str) =>
    PersonRangeDateModel.fromJson(json.decode(str));

String personRangeDateToJson(PersonRangeDateModel data) =>
    json.encode(data.toJson());

class PersonRangeDateModel {
  PersonRangeDateModel({
    this.initialDate,
    this.finalDate,
  });
  factory PersonRangeDateModel.fromJson(Map<String, dynamic> json) =>
      PersonRangeDateModel(
        initialDate: DateTime.parse(json['initialDate']),
        finalDate: DateTime.parse(json['finalDate']),
      );

  DateTime? initialDate;
  DateTime? finalDate;

  Map<String, dynamic> toJson() => {
        'initialDate': initialDate?.toIso8601String(),
        'finalDate': finalDate?.toIso8601String(),
      };
}
