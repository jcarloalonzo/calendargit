// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import '../../../../core/config/Utils.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/requests/add_person_worker_request.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class AddWorkerBloc extends StateNotifier {
//

  AddWorkerBloc({required this.login, required this.business});

  final LoginResponse login;
  final BusinessResponse business;

  //

  //
  //
  //
  //
  //
  late List<PersonResponse> _workers;
  List<PersonResponse> get workers => _workers;
  init() async {
    // _workers = [];

    nroDocumentoController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();

    _request = AddPersonWorkerRequest();

    // _workers = await getWorkers();
    notifyListeners();
  }

  late AddPersonWorkerRequest _request;
  AddPersonWorkerRequest get request => _request;

  late TextEditingController nroDocumentoController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  AddPersonWorkerRequest? getRequest() {
    final String nroDoc = nroDocumentoController.text;
    final String name = nameController.text;
    final String surname = surnameController.text;
    final String phone = phoneController.text;
    final String email = emailController.text;

    if (MyUtils.stringIsnullOrEmpty(nroDoc)) {
      setError('Debe ingresar el número de documento');
      return null;
    }
    if (MyUtils.stringIsnullOrEmpty(name)) {
      setError('Debe ingresar el nombre');
      return null;
    }

    if (MyUtils.stringIsnullOrEmpty(surname)) {
      setError('Debe ingresar el apellido');
      return null;
    }

    return _request = AddPersonWorkerRequest(
      documentNumber: nroDoc,
      name: name,
      surname: surname,
      phoneNumber: phone,
      emailAddress: email,
      secondSurname: '',
      description: '',

      //
      //
      businessId: business.businessId,
      personTypeId: 2,
      officeId: login.userBusinessDto[0].officeId,
    );
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
    nroDocumentoController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
