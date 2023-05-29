// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../../data/models/entities/login_model.dart';
import '../../../../data/models/responses/business_response.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../bloc/state_notifier.dart';

class AccountBloc extends StateNotifier {
//

  AccountBloc({
    required this.login,
    required this.business,
  });

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

  late UserBusinessDto _office;
  UserBusinessDto get office => _office;

  init() async {
    if (login.userBusinessDto.isNotEmpty) {
      _office = login.userBusinessDto[0];
      notifyListeners();
    }
  }
}
