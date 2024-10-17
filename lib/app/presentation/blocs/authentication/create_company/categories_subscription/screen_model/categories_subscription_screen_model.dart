import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/models/category.dart';

part 'categories_subscription_screen_model.freezed.dart';

@freezed
class CategoriesSubscriptionScreenModel
    with _$CategoriesSubscriptionScreenModel {
  const factory CategoriesSubscriptionScreenModel({
    required String identification,
    required String codeUID,
    required String companyName,
    required String legalName,
    required String website,
    required String companyPhone,
    required String contactEmail,
    required String contactPhone,
    required String contactName,
    //
    required String officeName,
    required String officeAddess,
    required String officePhone,
    required String username,
    required String password,
    required List<Category> categories,
    @Default([]) List<Category> categoriesSelected,
  }) = _CategoriesSubscriptionScreenModel;
}
