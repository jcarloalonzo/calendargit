import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/config.dart';
import '../models/entities/response_model.dart';
import '../models/requests/service_request.dart';

class APIService {
  static Future<ResponseModel<num>> getPrice(
      {required GetPriceRequest obj}) async {
    ResponseModel<num> responseData = ResponseModel<num>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}service/getPrice/${obj.businessID}/office/${obj.officeID}/service/${obj.serviceID}?date=${obj.date}';

      final resp = await http.get(
        Uri.parse(url),
      );

      // print(resp.body);
      // final decodeData = json.decode(resp.body);
      // print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        responseData.data = json.decode(resp.body);
      } else {
        responseData.statusCode = resp.statusCode;
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
      }
      return responseData;
    } catch (e) {
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 500, message: e.toString());
      return responseData;
    }
  }
}
