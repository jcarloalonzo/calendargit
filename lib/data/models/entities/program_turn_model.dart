// To parse this JSON data, do
//
//     final progamTurnModel = progamTurnModelFromJson(jsonString);

import 'dart:convert';

List<ProgamTurnModel> progamTurnModelFromJson(String str) =>
    List<ProgamTurnModel>.from(
        json.decode(str).map((x) => ProgamTurnModel.fromJson(x)));

String progamTurnModelToJson(List<ProgamTurnModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgamTurnModel {
  ProgamTurnModel({
    this.initialTurn,
    this.finalTurn,
    this.state,
  });

  String? initialTurn;
  String? finalTurn;
  int? state;

  factory ProgamTurnModel.fromJson(Map<String, dynamic> json) =>
      ProgamTurnModel(
        initialTurn: json["initialTurn"],
        finalTurn: json["finalTurn"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "initialTurn": initialTurn,
        "finalTurn": finalTurn,
        "state": state,
      };
}
