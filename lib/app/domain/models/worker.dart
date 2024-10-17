import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    @JsonKey(name: 'personID') required int personId,
    @JsonKey(name: 'personTypeID') required int personTypeId,
    @JsonKey(name: 'documentTypeID') required int documentTypeId,
    @JsonKey(name: 'documentNumber') required String documentNumber,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'surname') required String surname,
    @JsonKey(name: 'secondSurname') required String secondSurname,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    @JsonKey(name: 'emailAddress') required String emailAddress,
    @JsonKey(name: 'uImage') required dynamic uImage,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'active') required bool active,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}
