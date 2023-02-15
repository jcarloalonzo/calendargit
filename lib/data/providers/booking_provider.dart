import 'package:calendario/core/config/config.dart';
import 'package:calendario/data/models/entities/anula_booking_request.dart';
import 'package:calendario/data/models/entities/booking.dart';
import 'package:calendario/data/models/entities/complete_booking_request.dart';
import 'package:calendario/data/models/entities/home_model.dart';
import 'package:calendario/data/models/entities/program_turn_model.dart';
import 'package:calendario/data/models/entities/reprogram_request.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/data/models/entities/services_hours_model.dart';
import 'package:calendario/data/models/requests/booking_request.dart';
import 'package:calendario/data/models/requests/generate_invoice_booking_request.dart';
import 'package:calendario/data/models/requests/register_booking_request.dart';
import 'package:calendario/data/models/responses/to_invoice_response.dart';
import 'package:calendario/data/models/responses/to_register_schedule_free_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIBooking {
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

      final resp = await http.get(
        Uri.parse(url),
      );

      final decodeData = json.decode(resp.body);
      print(decodeData);
//

      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((i) => Booking.fromJson(i))
            .toList();
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

  static Future<ResponseModel> validateToReprogram(
      {required int bookingID}) async {
    ResponseModel responseData = ResponseModel();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}v1/booking/validateToReprogram/$bookingID';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{},
        ),
      );

      // print(resp.body);
      // final decodeData = json.decode(resp.body);
      // print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        // responseData.data = true;
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);

      }
      return responseData;
    } catch (e) {
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 500, message: e.toString());
      return responseData;
    }
  }

  //

  static Future<ResponseModel<PersonRangeDateModel>> personGetRangeDate(
      int personID) async {
    var responseData = ResponseModel<PersonRangeDateModel>();

    try {
      final url =
          '${Config.urlWebCliente}program/getRangeDate/personID/$personID';

      final resp = await http.get(Uri.parse(url));
      // final decodeData = json.decode(resp.body);
      // print(decodeData);
      if (resp.statusCode == 200) {
        responseData.data =
            PersonRangeDateModel.fromJson(json.decode(resp.body));
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error =
        //     ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);

      }
      return responseData;
    } catch (e) {
      print(e);
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 0, message: e.toString());
      return responseData;
    }
  }

  static Future<ResponseModel<List<ProgamTurnModel>>> programGetTurn(
      {required GetTurnRequest obj}) async {
    var responseData = ResponseModel<List<ProgamTurnModel>>();

    try {
      final url =
          '${Config.urlWebCliente}program/getTurn/personID/${obj.personID}/serviceID/${obj.serviceID}/dateProgram/${obj.dateProgram}';
      final resp = await http.get(Uri.parse(url));
      // final decodeData = json.decode(resp.body);
      if (resp.statusCode == 200) {
        responseData.data = (json.decode(resp.body) as List)
            .map((e) => ProgamTurnModel.fromJson(e))
            .toList();
      } else {
        responseData.statusCode = resp.statusCode;
        // responseData.error =
        //     ResponseErrorModel.fromJson(json.decode(resp.body));

        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);

      }
      return responseData;
    } catch (e) {
      print(e);
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 0, message: e.toString());
      return responseData;
    }
  }

  static Future<ResponseModel<bool>> reprogramBooking(
      {required ReprogramRequest obj}) async {
    ResponseModel<bool> responseData = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}v1/booking/reprogram/${obj.bookingId}';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            "User": obj.user,
            "businessID": obj.businessId,
            "businessIdent": obj.businessIdent,
            "date": obj.date,
            "initialTime": obj.initialTime,
            "finalTime": obj.finalTime
          },
        ),
      );

      // final decodeData = json.decode(resp.body);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        // responseData.data = true;
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);

      }
      return responseData;
    } catch (e) {
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 500, message: e.toString());
      return responseData;
    }
  }

  //

  static Future<ResponseModel<bool>> completeBookingAPI(
      {required CompleteBookingRequest obj}) async {
    ResponseModel<bool> responseData = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/confirm/${obj.bookingId}';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            "AuthorizedUser": obj.authorizedUser,
            "businessID": obj.businessId,
            "businessIdent": obj.businessIdent,
            "officeID": obj.officeId,
          },
        ),
      );

      // print(resp.body);
      // final decodeData = json.decode(resp.body);
      // print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        // responseData.data = true;
        // responseData.statusCode = 500;
        // responseData.error = ResponseErrorModel(code: 500, message: 'prueba');
      } else {
        responseData.statusCode = resp.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(resp.body));
        // responseData.error = ResponseErrorModel(
        //     code: decodeData['Code'], message: decodeData['Message']);

      }
      return responseData;
    } catch (e) {
      responseData.statusCode = 500;
      responseData.error = ResponseErrorModel(code: 500, message: e.toString());
      return responseData;
    }
  }

  static Future<ResponseModel<bool>> anulaBooking(
      {required AnulaBookingRequest obj}) async {
    ResponseModel<bool> responseData = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/anulate/${obj.bookingId}';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            "user": obj.user,
            "businessID": obj.businessId,
            "businessIdent": obj.businessIdent,
            "reason": obj.reason
          },
        ),
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

  static Future<ResponseModel<ToInvoiceResponse>> generateInvoice(
      {required GenerateInvoiceBookingRequest obj,
      required int bookingID}) async {
    ResponseModel<ToInvoiceResponse> responseData =
        ResponseModel<ToInvoiceResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/invoice/$bookingID';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: generateInvoiceBookingRequestToJson(obj),
      );

      // print(resp.body);
      // final decodeData = json.decode(resp.body);
      // print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        // responseData.data = json.decode(resp.body);
        responseData.data = ToInvoiceResponse.fromJson(json.decode(resp.body));
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

  static Future<ResponseModel<ToRegisterScheduleFreeResponse>> registerScheduleFree(
      {required RegisterBookingRequest obj, required int businessID}) async {
    ResponseModel<ToRegisterScheduleFreeResponse> responseData = ResponseModel<ToRegisterScheduleFreeResponse>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/register/$businessID';

      final resp = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: registerBookingRequestToJson(obj),
      );

      print(resp.body);
      final decodeData = json.decode(resp.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responseData.statusCode = resp.statusCode;
      if (resp.statusCode == 200) {
        responseData.data = ToRegisterScheduleFreeResponse.fromJson(json.decode(resp.body));

        // responseData.data = ToInvoiceResponse.fromJson(json.decode(resp.body));
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

//
//
