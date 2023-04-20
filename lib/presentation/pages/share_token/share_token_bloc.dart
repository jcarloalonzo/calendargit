// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, avoid_print

import '../../../data/models/entities/login_model.dart';
import '../../../data/models/responses/business_response.dart';
import '../../bloc/state_notifier.dart';

class ShareTokenBloc extends StateNotifier {
  ShareTokenBloc({required this.login, required this.business});

  final LoginResponse login;
  final BusinessResponse business;

  init() async {
    //
    //
  }

  void dipose() {
    notifyListeners();
  }
}
