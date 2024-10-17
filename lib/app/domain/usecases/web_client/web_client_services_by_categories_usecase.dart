import '../../../data/entities/requests/id_request.dart';
import '../../../data/entities/responses/services_category_response.dart';
import '../../either/either.dart';
import '../../models/category.dart';
import '../../repositories/web_client_repository.dart';

class WebClientServicesByCategoriesUsecase {
  WebClientServicesByCategoriesUsecase(
      {required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<ServicesCategoryResponse>>> call(
      {required List<Category> categories}) {
    List<IdRequest> ids =
        categories.map((e) => IdRequest(id: e.categoryId)).toList();

    return _repository.servicesByCategories(categoryIds: ids);
  }
}
