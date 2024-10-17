import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_request.freezed.dart';
part 'id_request.g.dart';

@freezed
class IdRequest with _$IdRequest {
  const factory IdRequest({
    @JsonKey(name: 'ID') required int id,
  }) = _IdRequest;

  factory IdRequest.fromJson(Map<String, dynamic> json) =>
      _$IdRequestFromJson(json);
}
