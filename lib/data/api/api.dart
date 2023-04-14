import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/config.dart';
import '../models/entities/category.dart';
import '../models/entities/login_model.dart';
import '../models/entities/response_model.dart';
import '../models/entities/services_response.dart';
import '../models/requests/create_company_request.dart';
import '../models/requests/login_request.dart';
import '../models/responses/business_response.dart';
import '../models/responses/company_by_token_response.dart';
import '../models/responses/validate_token_response.dart';

class API {
  static Future<ResponseModel<ValidateTokenResponse>> validateToken(
      String token) async {
    ResponseModel<ValidateTokenResponse> responsedata =
        ResponseModel<ValidateTokenResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlProvider}Company/ValidateToken?token=$token';
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data = ValidateTokenResponse.fromRawJson(response.body);
        print(responsedata);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error = ResponseErrorModel(
          code: decodeData['Code'], message: decodeData['Message']);

      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<CompanyByTokenResponse>> getCompanyByToken(
      String token) async {
    ResponseModel<CompanyByTokenResponse> responsedata =
        ResponseModel<CompanyByTokenResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlProvider}Company/GetCompanyByToken?token=$token';
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data =
            CompanyByTokenResponse.companyByTokenResponseFromJson(
                response.body);
        print(responsedata);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error = ResponseErrorModel(
          code: decodeData['Code'], message: decodeData['Message']);

      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<BusinessResponse>> createCompany(
      CreateCompanyRequest request) async {
    ResponseModel<BusinessResponse> responsedata =
        ResponseModel<BusinessResponse>();

    print(request.toRawJson());
    print('🤞');
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      const url = '${Config.urlWebCliente}business/create';

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: request.toRawJson(),
      );
      print(response);
      print(response.body);
      responsedata.statusCode = response.statusCode;
      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        //
        //
        responsedata.data =
            BusinessResponse.businessResponseFromJson(response.body);
        print(responsedata);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error = ResponseErrorModel(
          code: decodeData['Code'], message: decodeData['Message']);

      return responsedata;
    } catch (e) {
      print(e);
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  //
  //

  static Future<ResponseModel<bool>> sincronizationToken(String token) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlProvider}Company/sincronizationToken?token=$token';
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data = true;
        print(responsedata);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error = ResponseErrorModel(
          code: decodeData['Code'], message: decodeData['Message']);

      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<BusinessResponse>> businessByToken(
      String token) async {
    ResponseModel<BusinessResponse> responsedata =
        ResponseModel<BusinessResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}business/BusinessByToken?token=$token';
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data =
            BusinessResponse.businessResponseFromJson(response.body);
        print(responsedata);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error = ResponseErrorModel(
          code: decodeData['Code'], message: decodeData['Message']);

      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<LoginResponse>> login(LoginRequest obj) async {
    ResponseModel<LoginResponse> responseData = ResponseModel<LoginResponse>();
    try {
      const url = '${Config.urlWebCliente}User/ValidateLogin';
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: LoginRequest.loginRequestToJson(obj),
      );
      responseData.statusCode = response.statusCode;

      if (response.statusCode == 200) {
        responseData.data = LoginResponse.loginModelFromJson(response.body);
        return responseData;
      }
      responseData.statusCode = response.statusCode;
      responseData.error =
          ResponseErrorModel.fromJson(json.decode(response.body));

      return responseData;
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 500, message: error.toString());
      return responseData;
    }
  }

  static Future<ResponseModel<List<Category>>> listCategories() async {
    var responseData = ResponseModel<List<Category>>();
    try {
      const url = '${Config.urlWebCliente}category/getAll';

      final response = await http.get(
        Uri.parse(url),
      );

      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responseData.data = (json.decode(response.body) as List)
            .map((i) => Category.fromJson(i))
            .toList();

        return responseData;
      }
      responseData.statusCode = response.statusCode;
      responseData.error =
          ResponseErrorModel.fromJson(json.decode(response.body));
      return responseData;
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }

  static Future<ResponseModel<List<ServicesResponse>>> servicesByCategories(
      List<EsIdRequest> ids) async {
    print(EsIdRequest.esIdRequestToJson(ids));
    var responseData = ResponseModel<List<ServicesResponse>>();
    try {
      const url = '${Config.urlWebCliente}service/GetServiceByCategories';
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: EsIdRequest.esIdRequestToJson(ids),
      );

      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responseData.data = (json.decode(response.body) as List)
            .map((i) => ServicesResponse.fromJson(i))
            .toList();

        return responseData;
      }
      responseData.statusCode = response.statusCode;
      responseData.error =
          ResponseErrorModel.fromJson(json.decode(response.body));
      return responseData;
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }
}
