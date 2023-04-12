// ignore_for_file: body_might_complete_normally_nullable

import '../api/api.dart';
import '../models/entities/category.dart';
import '../models/entities/login_model.dart';
import '../models/entities/response_model.dart';
import '../models/requests/create_company_request.dart';
import '../models/requests/login_request.dart';
import '../models/responses/business_response.dart';
import '../models/responses/company_by_token_response.dart';
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
}
