// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class WorkersBloc extends StateNotifier {
//

  WorkersBloc({required this.login, required this.business});

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
    _workers = [];

    _workers = await getWorkers();
    notifyListeners();
  }

  void dipose() {
    notifyListeners();
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
}
