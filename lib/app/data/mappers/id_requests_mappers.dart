import 'dart:convert';

import '../entities/requests/id_request.dart';

class IdRequestsMappers {
  const IdRequestsMappers._();
  static String toJson(List<IdRequest> ids) {
    List<Map<String, dynamic>> jsonList =
        ids.map((idRequest) => idRequest.toJson()).toList();
    return jsonEncode(jsonList);
  }
}
