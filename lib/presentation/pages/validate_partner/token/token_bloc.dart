import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/preferences/preferences_user.dart';
import '../../../../data/provider/provider_data.dart';
import '../splash/splash_bloc.dart';

class TokenBloc with ChangeNotifier {
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

  Future init(
    BuildContext context,
  ) async {
    //
    //
  }

//
//
//
//
//
  TextEditingController tokenController = TextEditingController();

  // Future<bool> validar() async {
  //   final token = tokenController.text;

  //   if (MyUtils.stringIsnullOrEmpty(token)) {
  //     // throw 'error';
  //     setError('Debe ingresar el token en el campo de texto');
  //     return false;
  //   }
  //   //
  //   _isLoading = true;
  //   notifyListeners();
  //   await Future.delayed(const Duration(seconds: 2), () {});

  //   registrarToken(token);

  //   _isLoading = false;
  //   notifyListeners();

  //   return true;
  // }

  void registrarToken(String tok) {
    final prefs = PreferencesUser();
    prefs.token = tok;
  }

  //
  Future<String?> getQR() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    if (barcodeScanRes == '-1') return null;
    return barcodeScanRes;
  }

  Future<TypeLogin?> validateToken(String token) async {
    final prefs = PreferencesUser();
    try {
      final response = await ProviderData.validateToken(token);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      final tokenValidado = response.data;
      prefs.token = tokenValidado?.codeUid;
      if (!(tokenValidado!.isRegister!)) return TypeLogin.register;

      BusinessResponse? business = await businessByToken(token);
      if (business == null) return TypeLogin.register;

      return TypeLogin.login;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  Future<BusinessResponse?> businessByToken(String token) async {
    final prefs = PreferencesUser();
    try {
      if (prefs.business != null) {
        BusinessResponse? business =
            BusinessResponse.businessResponseFromJson(prefs.business!);

        return business;
      }
      final response = await ProviderData.businessByToken(token);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      final businessResp = response.data;
      prefs.business = BusinessResponse.businessResponseToJson(businessResp!);
      return businessResp;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }
}
