import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_business_dto.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'PersonID') required int personId,
    @JsonKey(name: 'PersonTypeID') required int personTypeId,
    @JsonKey(name: 'DocumentTypeID') required int documentTypeId,
    @JsonKey(name: 'DocumentNumber') required String documentNumber,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'EmailAddress') required String emailAddress,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'UserBusinessDTO')
    required List<UserBusinessDto> userBusinessDto,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  UserBusinessDto? get userBusinessData =>
      userBusinessDto.isNotEmpty ? userBusinessDto.first : null;
}
