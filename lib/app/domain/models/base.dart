import 'package:freezed_annotation/freezed_annotation.dart';

part 'base.freezed.dart';

@freezed
class Base with _$Base {
  const factory Base({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'description') required String label,
  }) = _Base;
}
