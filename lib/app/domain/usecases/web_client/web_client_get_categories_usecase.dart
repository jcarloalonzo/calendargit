import '../../either/either.dart';
import '../../models/category.dart';
import '../../repositories/web_client_repository.dart';

class WebClientGetCategoriesUsecase {
  WebClientGetCategoriesUsecase({required WebClientRepository repository})
      : _repository = repository;

  final WebClientRepository _repository;
  Future<Either<String, List<Category>>> call() {
    return _repository.getCategories();
  }
}
