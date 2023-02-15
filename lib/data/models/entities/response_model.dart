import 'package:calendario/presentation/widgets/my_dialogs.dart';
import 'package:flutter/cupertino.dart';

class ResponseModel<T> {
  int? statusCode = 200;
  ResponseErrorModel? error;
  T? data;

  static void handleError(dynamic bloc, BuildContext context) {
    if (bloc.error != null) {
      if (bloc.error!.error != null) {
        Future.delayed(Duration.zero, () async {
          MyDialogs.yesAbortDialog(
              context: context,
              body: bloc.error?.error?.message ?? 'Error',
              onlyButtom: true);
          bloc.error = null;
        });
      }
    }
  }
}

class ResponseErrorModel {
  int? code;
  String? message;
  ResponseErrorModel({this.code, this.message});

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) =>
      ResponseErrorModel(
        code: json["Code"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
