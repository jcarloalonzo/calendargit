// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:calendario/core/config/config.dart';
import 'package:calendario/data/models/entities/anula_booking_request.dart';
import 'package:calendario/data/models/entities/booking.dart';
import 'package:calendario/data/models/entities/booking_detail_model.dart';
import 'package:calendario/data/models/entities/complete_booking_request.dart';
import 'package:calendario/data/models/entities/confirm_booking_request.dart';
import 'package:calendario/data/models/entities/liquidation_model.dart';
import 'package:calendario/data/models/entities/program_turn_model.dart';
import 'package:calendario/data/models/entities/reprogram_request.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/data/models/entities/servicelist.dart';
import 'package:calendario/data/models/entities/services_hours_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  dynamic getHeader() {
    return {
      "Content-Type": "application/json",
    };
  }

  dynamic getHeaderToken({String? token}) {
    if (token != null) {
      return {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      };
    } else {
      return {
        "Content-Type": "application/json",
      };
    }
  }

  dynamic getHeaderurlcoded() {
    return {
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    };
  }


  Future<ResponseModel<List<Booking>>> getBookingList(
      {required int businessID,
      required int personID,
      required String initialDate,
      required String finalDate,
      required int bookingStateID}) async {
    var responseData = ResponseModel<List<Booking>>();
    try {
      final url =
          '${Config.urlWebCliente}v1/booking/getBookingList/$businessID?personID=$personID&InitialDate=$initialDate&FinalDate=$finalDate&BookingStateID=$bookingStateID';

      final response = await http.get(
        Uri.parse(url),
        headers: getHeaderToken(),
      );

      final decodeData = json.decode(response.body);

      print(decodeData);

      if (response.statusCode == 200) {
        responseData.data = (json.decode(response.body) as List)
            .map((i) => Booking.fromJson(i))
            .toList();
      } else {
        responseData.statusCode = response.statusCode;
        responseData.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
    } catch (error) {
      responseData.statusCode = 500;
      responseData.error =
          ResponseErrorModel(code: 0, message: error.toString());
    }
    return responseData;
  }

  static Future<ResponseModel<BookingDetail>?> getBookingDetail(
      int bookingId) async {
    var responsedata = ResponseModel<BookingDetail>();

    try {
      final url = '${Config.urlWebCliente}v1/booking/get/$bookingId';

      final response = await http.get(Uri.parse(url));

      final decodeData = json.decode(response.body);

      if (response.statusCode == 200) {
        responsedata.data = BookingDetail.fromJson(decodeData);
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

// CONFIRM BOOKING REQUEST

  static Future<ResponseModel<bool>> confirmBooking(
      ConfirmBookingRequest obj, int bookingId) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/confirm/$bookingId';

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            "AuthorizedUser": obj.authorizedUser,
            "businessID": obj.businessId,
            "businessIdent": obj.businessIdent,
            "officeID": obj.officeId,
            "completed": obj.completed,
            "invoice": obj.invoice,
            "priceFinal": obj.priceFinal,
            "comment": obj.comment,
            "telephone": obj.telephone,
            "emailAddress": obj.emailAddress,
            "subAmount": obj.subAmount ?? 0,
            "taxPorc": obj.taxPorc ?? 0,
            "taxAmount": obj.taxAmount ?? 0,
            "taxPorc1": obj.taxPorc1 ?? 0,
            "taxAmount1": obj.taxAmount1 ?? 0,
            "amount": obj.amount ?? 0,
            "typePayment": obj.typePayment,
            "payment": obj.payment ?? 0,
            "dscto": obj.dscto ?? 0
          },
        ),
      );

      final decodeData = json.decode(response.body);

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

  static Future<ResponseModel<LiquidationAmount>?> getLiquidationAmount(
      {required int userID,
      required String liqDate,
      required int businessID}) async {
    var responsedata = ResponseModel<LiquidationAmount>();

    try {
      final url =
          '${Config.urlWebCliente}liquidation/getAmount/$userID/liqDate/$liqDate?businessID=$businessID';

      final response = await http.get(Uri.parse(url));

      final decodeData = json.decode(response.body);

      if (response.statusCode == 200) {
        responsedata.data = LiquidationAmount.fromJson(decodeData);
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<List<LiquidationDetails>>> getLiquidationDetails(
      {required int userID,
      required String liqDate,
      required int businessID}) async {
    var response = ResponseModel<List<LiquidationDetails>>();
    try {
      final url =
          '${Config.urlWebCliente}liquidation/getDetails/$userID/liqDate/$liqDate?businessID=$businessID';

      final resp = await http.get(Uri.parse(url));

      if (resp.statusCode == 200) {
        response.data = (json.decode(resp.body) as List)
            .map((i) => LiquidationDetails.fromJson(i))
            .toList();
      } else {
        response.statusCode = resp.statusCode;
        response.error = ResponseErrorModel.fromJson(json.decode(resp.body));
      }
    } catch (error) {
      response.statusCode = 500;
      response.error = ResponseErrorModel(code: 0, message: error.toString());
    }
    return response;
  }

  static Future<ResponseModel<String>> getReportLiquidationExcel(
      {required int userID,
      required String liqDate,
      required int businessID}) async {
    var responsedata = ResponseModel<String>();

    try {
      final url =
          '${Config.urlWebCliente}liquidation/getExcel/$userID/liqDate/$liqDate?businessID=$businessID';

      final response = await http.get(Uri.parse(url));

      final decodeData = json.decode(response.body);

      if (response.statusCode == 200) {
        responsedata.data = decodeData;
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responsedata;
    } catch (e) {
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  Future<ResponseModel> validateToReprogram({required int bookingID}) async {
    ResponseModel responsedata = ResponseModel();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}v1/booking/validateToReprogram/$bookingID';

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
        // responsedata.data = true;
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

  //
  //

  static Future<ResponseModel<PersonRangeDateModel>> personGetRangeDate(
      int personID) async {
    var responsedata = ResponseModel<PersonRangeDateModel>();

    try {
      final url =
          '${Config.urlWebCliente}program/getRangeDate/personID/$personID';

      final response = await http.get(Uri.parse(url));
      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responsedata.data = PersonRangeDateModel.fromJson(decodeData);
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responsedata;
    } catch (e) {
      print(e);
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<List<ProgamTurnModel>>> programGetTurn(
      {required int personID,
      required int serviceID,
      required String date}) async {
    var responsedata = ResponseModel<List<ProgamTurnModel>>();

    try {
      final url =
          '${Config.urlWebCliente}program/getTurn/personID/$personID/serviceID/$serviceID/dateProgram/$date';
      final response = await http.get(Uri.parse(url));
      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);
      if (response.statusCode == 200) {
        responsedata.data = (json.decode(response.body) as List)
            .map((e) => ProgamTurnModel.fromJson(e))
            .toList();
      } else {
        responsedata.statusCode = response.statusCode;
        responsedata.error =
            ResponseErrorModel.fromJson(json.decode(response.body));
      }
      return responsedata;
    } catch (e) {
      print(e);
      responsedata.statusCode = 500;
      responsedata.error = ResponseErrorModel(code: 0, message: e.toString());
      return responsedata;
    }
  }

  static Future<ResponseModel<bool>> reprogramBooking(
      {required ReprogramRequest obj}) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url =
          '${Config.urlWebCliente}v1/booking/reprogram/${obj.bookingId}';

      final response = await http.post(
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

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        // responsedata.data = true;
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

  //
  //
  //
  //

  static Future<ResponseModel<bool>> anulaBookingAPI(
      {required AnulaBookingRequest obj}) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/anulate/${obj.bookingId}';

      final response = await http.post(
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

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        // responsedata.data = true;
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
  //
  //
  //
  //

  // static Future<ResponseModel<bool>> completeBookingAPI(
  //     {required CompleteBookingRequest obj}) async {
  //   ResponseModel<bool> responsedata = ResponseModel<bool>();
  //   try {
  //     // final url = '${urlWebServer.toString()}api/Company/Register';
  //     final url = '${Config.urlWebCliente}v1/booking/confirm/${obj.bookingId}';

  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{'Content-Type': 'application/json'},
  //       // body: confirmBookingRequestToJson(obj),
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           "AuthorizedUser": obj.authorizedUser,
  //           "businessID": obj.businessId,
  //           "businessIdent": obj.businessIdent,
  //           "officeID": obj.officeId,
  //           "completed": obj.completed,
  //           "invoice": obj.invoice,
  //           "priceFinal": obj.priceFinal,
  //           "comment": obj.comment,
  //           "telephone": obj.telephone,
  //           "emailAddress": obj.emailAddress,
  //           // "subAmount": 0,
  //           // "taxPorc": 0,
  //           // "taxAmount": 0,
  //           // "taxPorc1": 0,
  //           // "taxAmount1": 0,
  //           // "amount": 0,
  //           // "typePayment": 0,
  //           // "payment": 0,
  //           // "dscto": 0
  //         },
  //       ),
  //     );

  //     print(response.body);
  //     final decodeData = json.decode(response.body);
  //     print(decodeData);

  //     //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
  //     responsedata.statusCode = response.statusCode;
  //     if (response.statusCode == 200) {
  //       // responsedata.data = true;
  //     } else {
  //       responsedata.statusCode = response.statusCode;
  //       responsedata.error = ResponseErrorModel(
  //           code: decodeData['Code'], message: decodeData['Message']);
  //     }
  //     return responsedata;
  //   } catch (e) {
  //     responsedata.statusCode = 500;
  //     responsedata.error = ResponseErrorModel(code: 500, message: e.toString());
  //     return responsedata;
  //   }
  // }

  //

  static Future<ResponseModel<bool>> emitirInvoiceBookingAPI(
      {required CompleteBookingRequest obj}) async {
    ResponseModel<bool> responsedata = ResponseModel<bool>();
    try {
      // final url = '${urlWebServer.toString()}api/Company/Register';
      final url = '${Config.urlWebCliente}v1/booking/confirm/${obj.bookingId}';

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // body: confirmBookingRequestToJson(obj),
        body: jsonEncode(
          <String, dynamic>{
            "AuthorizedUser": obj.authorizedUser,
            "businessID": obj.businessId,
            "businessIdent": obj.businessIdent,
            "officeID": obj.officeId,
            // "completed": obj.completed,
            // "invoice": obj.invoice,
            // "priceFinal": obj.priceFinal,
            // "comment": obj.comment,
            // "telephone": obj.telephone,
            // "emailAddress": obj.emailAddress,
            // "subAmount": obj.subAmount ?? 0,
            // "taxPorc": obj.taxPorc ?? 0,
            // "taxAmount": obj.taxAmount ?? 0,
            // "taxPorc1": obj.taxPorc1 ?? 0,
            // "taxAmount1": obj.taxAmount1 ?? 0,
            // "amount": obj.amount ?? 0,
            // "typePayment": obj.typePayment,
            // "payment": obj.payment ?? 0,
            // "dscto": obj.dscto ?? 0
          },
        ),
      );

      print(response.body);
      final decodeData = json.decode(response.body);
      print(decodeData);

      //PENDIENTE CAMBIAR STATUS CODE A TODOS LOS APIS
      responsedata.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        // responsedata.data = true;
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
  //
  //
}

final serviceList = <ServiceList>[
  ServiceList(
      datereal: DateTime.now(),
      datehour: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 04, 30),
      datehourfinal: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 05),
      client: 'Patricia Suarez',
      service: 'Laceado Japones'),
  ServiceList(
      datereal: DateTime.now(),
      datehour: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7),
      datehourfinal: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 30),
      client: 'Martha Jimenez',
      service: 'Laceado Japones'),
];
