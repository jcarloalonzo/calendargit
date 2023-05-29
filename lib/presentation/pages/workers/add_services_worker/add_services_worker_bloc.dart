// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/requests/create_company_request.dart';
import '../../../../data/models/requests/set_services_person_request.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/services_business_response.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class AddServicesWorkerBloc extends StateNotifier {
//

  AddServicesWorkerBloc(
      {required this.login, required this.business, required this.personID});

  final LoginResponse login;
  final BusinessResponse business;

  //

  final int personID;
  //
  //
  //
  //
  //
  late List<ServiceBusinessResponse> _services;
  List<ServiceBusinessResponse> get services => _services;

  late List<ServiceBusinessResponse> _servicesSelected;
  List<ServiceBusinessResponse> get servicesSelected => _servicesSelected;
  init() async {
    _services = [];
    _servicesSelected = [];

    _services = await getServicesBusiness();
    notifyListeners();
  }

  // Future<int?> registrar() async {
  //   try {
  //     //
  //     final String user = userController.text;
  //     final String password = passwordController.text;

  //     if (MyUtils.stringIsnullOrEmpty(user)) {
  //       setError('Debe ingresar un usuario');
  //       return null;
  //     }
  //     if (MyUtils.stringIsnullOrEmpty(password)) {
  //       setError('Debe ingresar una constraseña');
  //       return null;
  //     }

  //     personID.user = user;
  //     personID.password = password;

  //     print(personID.toRawJson());

  //     final response = await ProviderData.addPersonWorker(personID);

  //     if (response.error != null) {
  //       error = response;
  //       notifyListeners();
  //       return null;
  //     }

  //     return response.data;
  //     //
  //     //
  //   } catch (e) {
  //     setError(e.toString());
  //     return null;
  //   }
  // }

  Future<List<ServiceBusinessResponse>> getServicesBusiness() async {
    //
    // 2 -> empleados
    try {
      isLoading = true;

      final response =
          await ProviderData.servicesByBusiness(business.businessId!);
      isLoading = false;

      if (response.error != null) {
        error = response;
        notifyListeners();
        return [];
      }

      return response.data!;
    } catch (e) {
      setError(e.toString());
      return [];
    }
  }

  bool exists(ServiceBusinessResponse item) {
    final response =
        _servicesSelected.indexWhere((e) => e.serviceId == item.serviceId);
    if (response == -1) return false;
    return true;
  }

  Future<bool> setServices() async {
    try {
      print(_servicesSelected);

      List<EsIdRequest> servicesID =
          _servicesSelected.map((e) => EsIdRequest(id: e.serviceId)).toList();

      SetServicesPersonRequest request =
          SetServicesPersonRequest(personId: personID, servicesIds: servicesID);
      print(request.toRawJson());

      final response = await ProviderData.setServicesPerson(request);
      print(response);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  onTapChip(ServiceBusinessResponse item) {
    if (exists(item)) {
      _servicesSelected.remove(item);
    } else {
      _servicesSelected.add(item);
    }
    notifyListeners();
  }
}
