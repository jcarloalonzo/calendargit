import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/config.dart';
import '../models/entities/login_model.dart';
import '../models/entities/response_model.dart';

class APILogin {
  static Future<ResponseModel<LoginModel>> getValidateLogin(
      {required String emailAdress, required String passToken}) async {
    ResponseModel<LoginModel> responseData = ResponseModel<LoginModel>();
    try {
      final url =
          '${Config.urlWebCliente}User/ValidateLogin?EmailAddress=$emailAdress&PassToken=$passToken';
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        responseData.data = LoginModel.fromJson(json.decode(response.body));
      } else {
        responseData.statusCode = response.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responseData;
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 500, message: error.toString());
      return responseData;
    }
  }
}
