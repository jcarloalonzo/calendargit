import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_worker.freezed.dart';
part 'service_worker.g.dart';

@freezed
class ServiceWorker with _$ServiceWorker {
  const factory ServiceWorker({
    @JsonKey(name: 'serviceID') required int serviceId,
    @JsonKey(name: 'serviceCode') required String serviceCode,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'shortDescription') required String shortDescription,
    @JsonKey(name: 'time') required String time,
  }) = _ServiceWorker;

  factory ServiceWorker.fromJson(Map<String, dynamic> json) =>
      _$ServiceWorkerFromJson(json);
}
