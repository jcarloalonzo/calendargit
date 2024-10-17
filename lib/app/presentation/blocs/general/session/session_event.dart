import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/business.dart';
import '../../../../domain/models/user.dart';

part 'session_event.freezed.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.updateUser({User? user}) = SessionUpdateUserEvent;
  const factory SessionEvent.updateBusiness({Business? business}) =
      SessionUpdateBusinessEvent;
  const factory SessionEvent.logout() = SessionLogoutEvent;
}
