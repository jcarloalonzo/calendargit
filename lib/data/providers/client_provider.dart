import 'package:calendario/core/config/config.dart';
import 'package:calendario/data/models/entities/client_entity.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIClient {
  static Future<ResponseModel<List<ClientEntity>>> getClient(
      {String? search}) async {
    var responseData = ResponseModel<List<ClientEntity>>();

    try {
      const url = '${Config.urlWebCliente}cliente/get';

      final resp = await http.get(
        Uri.parse(url),
      );
      print(resp.body);
      final decodeData = json.decode(resp.body);
      print(decodeData);

      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((i) => ClientEntity.fromJson(i))
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
