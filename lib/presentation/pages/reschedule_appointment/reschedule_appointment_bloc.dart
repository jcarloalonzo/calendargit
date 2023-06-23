// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../data/models/entities/login_model.dart';
import '../../../data/models/entities/services_hours_model.dart';
import '../../../data/models/responses/business_response.dart';
import '../../../data/provider/provider_data.dart';
import '../../bloc/state_notifier.dart';

class RescheduleAppointmentBloc extends StateNotifier {
  RescheduleAppointmentBloc({required this.login, required this.business});

  final LoginResponse login;
  final BusinessResponse business;

  init() async {
    //
    //
  }

  Future<PersonRangeDateModel?> personGetRangeDate(int personID) async {
    try {
      var response = await ProviderData.personGetRangeDate(
          businessID: business.businessId!, personId: personID);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return null;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return null;
    }
  }

  // Future<List<ProgamTurnModel>?> programGetTurn(int personID) async {
  //   try {
  //     ProgramGetTurnRequest req = ProgramGetTurnRequest(
  //       personID: personID,
  //       dateProgram: MyUtils.formatDate(DateTime.now()),
  //       serviceID: _serviceDetail.serviceId,
  //       // serviceID: blocService.serviceDetail!.serviceId,
  //     );

  //     var response = await ProviderData.programGetTurn(req);
  //     if (response.error != null) {
  //       error = response;
  //       notifyListeners();
  //       return null;
  //     }
  //     return response.data!;
  //   } catch (e) {
  //     setError(e.toString());
  //     return null;
  //   }
  // }

  void dipose() {
    notifyListeners();
  }
}
