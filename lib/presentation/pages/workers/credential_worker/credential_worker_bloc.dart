// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/requests/add_person_worker_request.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class CredentialWorkerBloc extends StateNotifier {
//

  CredentialWorkerBloc(
      {required this.login, required this.business, required this.request});

  final LoginResponse login;
  final BusinessResponse business;

  //

  final AddPersonWorkerRequest request;
  //
  //
  //
  //
  //
  late List<PersonResponse> _workers;
  List<PersonResponse> get workers => _workers;
  init() async {
    String name = request.name!.toLowerCase();
    String surname = request.surname!.toLowerCase();

    String user = '${name[0]}$surname';

    userController = TextEditingController(text: user);
    passwordController = TextEditingController();
    notifyListeners();
  }

  late TextEditingController userController;
  late TextEditingController passwordController;

  Future<int?> registrar() async {
    try {
      //
      final String user = userController.text;
      final String password = passwordController.text;

      if (MyUtils.stringIsnullOrEmpty(user)) {
        setError('Debe ingresar un usuario');
        return null;
      }
      if (MyUtils.stringIsnullOrEmpty(password)) {
        setError('Debe ingresar una constraseña');
        return null;
      }

      request.user = user;
      request.password = password;

      print(request.toRawJson());

      final response = await ProviderData.addPersonWorker(request);

      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }

      return response.data;
      //
      //
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  Future<List<PersonResponse>> getWorkers() async {
    //
    // 2 -> empleados
    try {
      isLoading = true;

      final response =
          await ProviderData.personsByBusiness(business.businessId!, 1);
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

  @override
  void dispose() {
    // TODO: implement dispose
    userController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
