import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/config.dart';
import '../models/entities/anula_booking_request.dart';
import '../models/entities/booking.dart';
import '../models/entities/category.dart';
import '../models/entities/complete_booking_request.dart';
import '../models/entities/home_model.dart';
import '../models/entities/login_model.dart';
import '../models/entities/program_turn_model.dart';
import '../models/entities/response_model.dart';
import '../models/entities/services_hours_model.dart';
import '../models/entities/services_response.dart';
import '../models/requests/add_person_worker_request.dart';
import '../models/requests/booking_request.dart';
import '../models/requests/create_company_request.dart';
import '../models/requests/login_request.dart';
import '../models/requests/set_services_person_request.dart';
import '../models/responses/business_response.dart';
import '../models/responses/company_by_token_response.dart';
import '../models/responses/detail_service_person.dart';
import '../models/responses/person_response.dart';
import '../models/responses/services_business_response.dart';
import '../models/responses/validate_token_response.dart';

class API {
  static Future<ResponseModel<ValidateTokenResponse>> validateToken(
      String token) async {
    ResponseModel<ValidateTokenResponse> responsedata =
        ResponseModel<ValidateTokenResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlProvider}Company/ValidateToken?token=$token';
      print(url);
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
      print(url);
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
      print(url);

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
      print(url);
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
      print(url);
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
    print(LoginRequest.loginRequestToJson(obj));
    try {
      const url = '${Config.urlWebCliente}User/ValidateLogin';
      print(url);
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
      print(url);
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

  static Future<ResponseModel<List<PersonResponse>>> personsByBusiness(
      int businessID, int personTypeID) async {
    var responseData = ResponseModel<List<PersonResponse>>();
    try {
      final String url =
          '${Config.urlWebCliente}person/getByBusiness/$businessID/$personTypeID';
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responseData.data = (json.decode(response.body) as List)
            .map((i) => PersonResponse.fromJson(i))
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

  static Future<ResponseModel<int>> addPersonWorker(
      AddPersonWorkerRequest request) async {
    ResponseModel<int> responseData = ResponseModel<int>();
    try {
      const url = '${Config.urlWebCliente}person/addPerson';
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: request.toRawJson(),
      );
      print(response);
      responseData.statusCode = response.statusCode;

      if (response.statusCode == 200) {
        // responseData.data = LoginResponse.loginModelFromJson(response.body);
        responseData.data = json.decode(response.body);
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

  static Future<ResponseModel<List<ServiceBusinessResponse>>>
      servicesByBusiness(int businessID) async {
    var responseData = ResponseModel<List<ServiceBusinessResponse>>();
    try {
      final String url =
          '${Config.urlWebCliente}service/GetServicesByBusiness?businessID=$businessID';
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responseData.data = (json.decode(response.body) as List)
            .map((i) => ServiceBusinessResponse.fromJson(i))
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

  static Future<ResponseModel<bool>> setServicesPerson(
      SetServicesPersonRequest request) async {
    ResponseModel<bool> responseData = ResponseModel<bool>();
    try {
      const url = '${Config.urlWebCliente}person/setServicesPerson';
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: request.toRawJson(),
      );
      responseData.statusCode = response.statusCode;

      if (response.statusCode == 200) {
        // responseData.data = LoginResponse.loginModelFromJson(response.body);
        responseData.data = json.decode(response.body) as bool;
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

  static Future<ResponseModel<List<DetailServicePerson>>>
      getDetailServicePerson(
          {required int businessID, required int personID}) async {
    var responsedata = ResponseModel<List<DetailServicePerson>>();

    try {
      final url =
          '${Config.urlWebCliente}person/getDetailService/personID?BusinessID=$businessID&PersonID=$personID';
      print(url);
      final response = await http.get(Uri.parse(url));
      final decodeData = json.decode(response.body);
      // print(decodeData);
      if (response.statusCode == 200) {
        responsedata.data = (json.decode(response.body) as List)
            .map((e) => DetailServicePerson.fromJson(e))
            .toList();
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error =
          ResponseErrorModel.fromJson(json.decode(response.body));

      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<List<BookingHome>>> getBookingHome(
      {required int businessID,
      required int personID,
      required String date}) async {
    var responseData = ResponseModel<List<BookingHome>>();
    try {
      final url =
          '${Config.urlWebCliente}v1/booking/getBookingHome/businessID/$businessID/personID/$personID/date/$date';

      final resp = await http.get(
        Uri.parse(url),
      );

      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((i) => BookingHome.fromJson(i))
            .toList();
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
      }
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }

  static Future<ResponseModel<List<Booking>>> getBookingList(
      {required GetBookingListRequest obj}) async {
    var responseData = ResponseModel<List<Booking>>();
    try {
      final url =
          '${Config.urlWebCliente}v1/booking/getBookingList/${obj.businessID}?personID=${obj.personID}&InitialDate=${obj.initialDate}&FinalDate=${obj.finalDate}&BookingStateID=${obj.bookingStateID}';
      print(url);
      final resp = await http.get(Uri.parse(url));
      final decodeData = json.decode(resp.body);
      print(decodeData);
      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((i) => Booking.fromJson(i))
            .toList();
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
      }
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }

  static Future<ResponseModel<bool>> anulateBooking(
      AnulaBookingRequest obj) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/anulate/${obj.bookingId}';
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            'user': obj.user,
            'businessID': obj.businessId,
            'businessIdent': obj.businessIdent,
            'reason': obj.reason
          },
        ),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data = true;
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error = ResponseErrorModel(
            code: decodeData['Code'], message: decodeData['Message']);
      }
      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<bool>> completeBooking(
      CompleteBookingRequest obj) async {
    ResponseModel<bool> responseData = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/confirm/${obj.bookingId}';
      print(url);
      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
          <String, dynamic>{
            'AuthorizedUser': obj.authorizedUser,
            'businessID': obj.businessId,
            'businessIdent': obj.businessIdent,
            'officeID': obj.officeId,
          },
        ),
      );
      print(resp.body);
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        responseData.data = true;
      } else {
        responseData.statusCode = resp.statusCode;
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

  static Future<ResponseModel<bool>> validateToReprogram(int bookingID) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      final url =
          '${Config.urlWebCliente}v1/booking/validateToReprogram/$bookingID';
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{},
        ),
      );
      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);
      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        responsedata.data = true;
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error = ResponseErrorModel(
            code: decodeData['Code'], message: decodeData['Message']);
      }
      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<PersonRangeDateModel>> personGetRangeDate(
      {required int personID, required int businessID}) async {
    var responsedata = ResponseModel<PersonRangeDateModel>();

    try {
      final url =
          '${Config.urlWebCliente}program/getRangeDate/personID?personID=$personID&BusinessID=$businessID';
      print(url);

      final response = await http.get(Uri.parse(url));
      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responsedata.data = PersonRangeDateModel.fromJson(decodeData);
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error =
          ResponseErrorModel.fromJson(json.decode(response.body));

      return responsedata;
    } catch (e) {
      print(e);
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<List<ProgamTurnModel>>> programGetTurn(
      ProgramGetTurnRequest obj) async {
    final responsedata = ResponseModel<List<ProgamTurnModel>>();

    try {
      final url =
          '${Config.urlWebCliente}program/getTurn/personID/${obj.personID}/serviceID/${obj.serviceID}/dateProgram/${obj.dateProgram}';
      print(url);

      final response = await http.get(Uri.parse(url));
      final decodeData = json.decode(response.body);
      // print(decodeData);
      if (response.statusCode == 200) {
        responsedata.data = (json.decode(response.body) as List)
            .map((e) => ProgamTurnModel.fromJson(e))
            .toList();
        return responsedata;
      }
      responsedata.statusCode = response.statusCode;
      responsedata.error =
          ResponseErrorModel.fromJson(json.decode(response.body));

      return responsedata;
    } catch (e) {
      print(e);
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }
}
