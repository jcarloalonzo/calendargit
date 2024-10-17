import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/entities/responses/services_category_response.dart';
import '../../../../../../domain/models/category.dart';

part 'services_subscription_screen_model.freezed.dart';

@freezed
class ServicesSubscriptionScreenModel with _$ServicesSubscriptionScreenModel {
  const factory ServicesSubscriptionScreenModel({
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
    required List<Category> categoriesSelected,
    required List<ServicesCategoryResponse> services,
    @Default([]) List<ServicesCategoryResponse> servicesSelected,
  }) = _ServicesSubscriptionScreenModel;
}
