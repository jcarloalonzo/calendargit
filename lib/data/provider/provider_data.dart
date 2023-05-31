// ignore_for_file: body_might_complete_normally_nullable

import '../api/api.dart';
import '../models/entities/booking.dart';
import '../models/entities/category.dart';
import '../models/entities/home_model.dart';
import '../models/entities/login_model.dart';
import '../models/entities/response_model.dart';
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

class ProviderData {
//
// //
  static Future<ResponseModel<ValidateTokenResponse>> validateToken(
      String obj) async {
    final response = await API.validateToken(obj);
    return response;
  }

  // //
  static Future<ResponseModel<CompanyByTokenResponse>> getCompanyByToken(
      String obj) async {
    final response = await API.getCompanyByToken(obj);
    return response;
  }

  static Future<ResponseModel<BusinessResponse>> createCompany(
      CreateCompanyRequest obj) async {
    final response = await API.createCompany(obj);
    return response;
  }

  static Future<ResponseModel<bool>> sincronizationToken(String obj) async {
    final response = await API.sincronizationToken(obj);
    return response;
  }

  static Future<ResponseModel<BusinessResponse>> businessByToken(
      String obj) async {
    final response = await API.businessByToken(obj);
    return response;
  }

  static Future<ResponseModel<LoginResponse>> login(LoginRequest obj) async {
    final response = await API.login(obj);
    return response;
  }

  static Future<ResponseModel<List<Category>>> listCategories() async {
    final response = await API.listCategories();
    return response;
  }

  static Future<ResponseModel<List<ServicesResponse>>> servicesByCategories(
      List<EsIdRequest> ids) async {
    final response = await API.servicesByCategories(ids);
    return response;
  }

  static Future<ResponseModel<List<PersonResponse>>> personsByBusiness(
      int businessID, int personTypeID) async {
    final response = await API.personsByBusiness(businessID, personTypeID);
    return response;
  }

  static Future<ResponseModel<int>> addPersonWorker(
      AddPersonWorkerRequest request) async {
    final response = await API.addPersonWorker(request);
    return response;
  }

  static Future<ResponseModel<List<ServiceBusinessResponse>>>
      servicesByBusiness(int businessID) async {
    final response = await API.servicesByBusiness(businessID);
    return response;
  }

  static Future<ResponseModel<bool>> setServicesPerson(
      SetServicesPersonRequest request) async {
    final response = await API.setServicesPerson(request);
    return response;
  }

  static Future<ResponseModel<List<DetailServicePerson>>>
      getDetailServicePerson(
          {required int businessID, required int personID}) async {
    return API.getDetailServicePerson(
        businessID: businessID, personID: personID);
  }

  static Future<ResponseModel<List<BookingHome>>> getBookingHome(
      {required int businessID,
      required int personID,
      required String date}) async {
    return API.getBookingHome(
        businessID: businessID, personID: personID, date: date);
  }

  static Future<ResponseModel<List<Booking>>> getBookingList(
      GetBookingListRequest request) async {
    return API.getBookingList(obj: request);
  }
}
