import 'package:flutter/cupertino.dart';

import '../../../../../core/config/Utils.dart';
import '../../../../../data/models/entities/response_model.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../../data/models/responses/company_by_token_response.dart';
import '../../../../../data/preferences/preferences_user.dart';

class RequestOfficeBloc with ChangeNotifier {
  ResponseModel? _error;
  ResponseModel? get error => _error;
  set error(ResponseModel? value) {
    _error = value;
    notifyListeners();
  }

  void setError(String v) {
    ResponseModel errorM = ResponseModel();
    ResponseErrorModel errorModel = ResponseErrorModel(message: v);
    errorM.error = errorModel;
    error = errorM;
    notifyListeners();
    return;
  }

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  //
  final bool _isVisible = false;
  bool get isVisible => _isVisible;

  CompanyByTokenResponse? _company;
  CompanyByTokenResponse? get company => _company;
  CreateCompanyRequest? _request;
  CreateCompanyRequest? get request => _request;

  Future init(
    BuildContext context, {
    required CompanyByTokenResponse companyO,
    required CreateCompanyRequest requestO,
  }) async {
    //
    _request = requestO;
    _company = companyO;

    nameOfficeController.text = '';
    phoneOfficeController.text = '';
    addressOfficeController.text = _company?.companyAddress[0].adress ?? '';
    //
  }

  TextEditingController nameOfficeController = TextEditingController();
  TextEditingController phoneOfficeController = TextEditingController();
  TextEditingController addressOfficeController = TextEditingController();
//
//
//
//
  TextEditingController tokenController = TextEditingController();

  CompanyByTokenResponse? _companySearched;

  CreateCompanyRequest? getRequestCompany() {
    try {
      String nameOffice = nameOfficeController.text;
      String addressOffice = addressOfficeController.text;
      String phoneOffice = phoneOfficeController.text;

      if (MyUtils.stringIsnullOrEmpty(nameOffice)) {
        setError('Debe ingresar un nombre de oficina.');
        return null;
      }

      _request?.officeName = nameOffice;
      _request?.officePhone = phoneOffice;
      _request?.adress = addressOffice;

      return request;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameOfficeController.dispose();
    addressOfficeController.dispose();
    phoneOfficeController.dispose();
    super.dispose();
  }
}
