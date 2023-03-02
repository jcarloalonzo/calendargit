import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/config.dart';
import '../models/entities/response_model.dart';
import '../models/entities/service.dart';

class APIPerson {
  static Future<ResponseModel<List<Service>>> getListServicePerson(
      {int? personID}) async {
    var responseData = ResponseModel<List<Service>>();

    try {
      final url =
          '${Config.urlWebCliente}person/getDetailService/personID/$personID';

      final resp = await http.get(
        Uri.parse(url),
      );
      print(resp.body);
      final decodeData = json.decode(resp.body);
      print(decodeData);

      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((i) => Service.fromJson(i))
            .toList();
        // responseData.statusCode = 500;
        // responseData.error = ResponseErrorModel(code: 0, message: 'pruebaaaaa');
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);
      }
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }
}
