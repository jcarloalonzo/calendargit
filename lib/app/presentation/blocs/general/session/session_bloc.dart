import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../dependency_injection.dart';
import '../../../../data/services/local/secure_storage_service.dart';
import '../../../../domain/models/business.dart';
import '../../../../domain/models/user.dart';
import '../bookings/bookings_bloc.dart';
import 'session_event.dart';
import 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionState()) {
    on<SessionUpdateUserEvent>(_sessionUpdateUserEvent);
    on<SessionUpdateBusinessEvent>(_sessionUpdateBusinessEvent);
    on<SessionLogoutEvent>(_sessionLogoutEvent);
  }

  void _sessionUpdateBusinessEvent(
      SessionUpdateBusinessEvent event, Emitter<SessionState> emit) {
    emit(state.copyWith(business: event.business));
  }

  void _sessionUpdateUserEvent(
      SessionUpdateUserEvent event, Emitter<SessionState> emit) {
    emit(state.copyWith(user: event.user));
  }

  void _sessionLogoutEvent(
      SessionLogoutEvent event, Emitter<SessionState> emit) {
    emit(SessionState());
  }

  void updateBusiness({Business? business}) {
    add(SessionUpdateBusinessEvent(business: business));
  }
  //
  //

  void updateUser({User? user}) {
    add(SessionUpdateUserEvent(user: user));
  }

  void logout() async {
    final secureService = getIt<SecureStorageService>();
    secureService.signOff();
    getIt<BookingsBloc>().logout();
    add(SessionLogoutEvent());
  }

  void logoutForceTokenApp() async {
    final secureService = getIt<SecureStorageService>();
    secureService.clearAll();
    getIt<BookingsBloc>().logout();
    add(SessionLogoutEvent());
  }
}
