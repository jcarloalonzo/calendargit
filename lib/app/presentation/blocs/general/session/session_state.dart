import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/business.dart';
import '../../../../domain/models/user.dart';

part 'session_state.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    // LoginResponse? user,
    User? user,
    Business? business,
  }) = _SessionState;
}
