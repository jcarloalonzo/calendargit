import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_model.freezed.dart';

@freezed
class HomeScreenModel with _$HomeScreenModel {
  const factory HomeScreenModel({
    required DateTime date,
  }) = _HomeScreenModel;
}
