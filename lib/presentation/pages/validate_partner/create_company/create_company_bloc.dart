import 'package:flutter/cupertino.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/requests/create_company_request.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/company_by_token_response.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../../data/provider/provider_data.dart';

class CreateCompanyBloc with ChangeNotifier {
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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //
  final bool _isVisible = false;
  bool get isVisible => _isVisible;

  Future init(
    BuildContext context,
  ) async {
    //
    //
    getData();
  }

  TextEditingController nameCompanyController = TextEditingController();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController webPageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameContactController = TextEditingController();
//
//
//
//
  TextEditingController tokenController = TextEditingController();

  CompanyByTokenResponse? _companySearched;

  Future getData() async {
    final prefsUser = PreferencesUser();
    if (prefsUser.token == null) return;
    try {
      _isLoading = true;
      notifyListeners();
      final response = await ProviderData.getCompanyByToken(prefsUser.token!);
      _isLoading = false;

      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      _companySearched = response.data;
      final company = response.data;
      nameCompanyController.text = company?.companyName ?? '';
      legalNameController.text = company?.companyName ?? '';
      webPageController.text = company?.webSite ?? '';
      emailController.text = company?.companyContact?[0].emailAdress ?? '';
      phoneController.text = company?.companyContact?[0].phoneNumber ?? '';
      adressController.text = company?.companyAddress?[0].adress ?? '';
      nameContactController.text = company?.companyContact?[0].name ?? '';
      notifyListeners();
      //
      //
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  Future validar() async {
    final token = tokenController.text;

    if (MyUtils.stringIsnullOrEmpty(token)) {
      // throw 'error';
      setError('Debe ingresar el token en el campo de texto');
      return;
    }
    //
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {});

    registrarToken(token);

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> createCompany() async {
    final prefs = PreferencesUser();
    try {
      String nameCompany = nameCompanyController.text;
      String legalName = legalNameController.text;
      String webPage = webPageController.text;
      String email = emailController.text;
      String phone = phoneController.text;
      String adress = adressController.text;
      String nameContact = nameContactController.text;

      CreateCompanyRequest request = CreateCompanyRequest(
        identification: _companySearched?.identification,
        businessTypeId: 1,
        businessName: nameCompany,
        emailAddress: email,
        legalName: legalName,
        phoneNumber: phone,
        contactPersonName: nameContact,
        codeuid: _companySearched?.codeUid,
        active: true,
      );

      final response = await ProviderData.createCompany(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }

      final sincronization =
          await ProviderData.sincronizationToken(request.codeuid!);
      if (sincronization.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      if (!(sincronization.data!)) {
        setError('Ocurrio un error en el proceso');
        return false;
      }
      final business = response.data;
      prefs.business = BusinessResponse.businessResponseToJson(business!);
      return true;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameCompanyController.dispose();
    legalNameController.dispose();
    webPageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    adressController.dispose();
    nameContactController.dispose();
    super.dispose();
  }
}
