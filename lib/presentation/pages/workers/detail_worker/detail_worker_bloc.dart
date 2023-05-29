// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/detail_service_person.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class DetailWorkerBloc extends StateNotifier {
//

  DetailWorkerBloc(
      {required this.login, required this.business, required this.worker});

  final LoginResponse login;
  final BusinessResponse business;

  //

  final PersonResponse worker;
  //
  //
  //
  //
  //
  late List<DetailServicePerson> _services;
  List<DetailServicePerson> get services => _services;

  init() async {
    _services = [];

    _services = await getServices();
    notifyListeners();
  }

  Future<List<DetailServicePerson>> getServices() async {
    try {
      isLoading = true;
      final response = await ProviderData.getDetailServicePerson(
          businessID: business.businessId!, personID: worker.personId);
      isLoading = false;

      print(response);
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
}
