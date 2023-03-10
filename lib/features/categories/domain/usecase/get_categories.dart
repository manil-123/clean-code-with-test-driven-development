import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart';

class GetCategories extends Usecase<List<Category>, NoParams> {
  final CategoryRepository categoryRepository;

  GetCategories(this.categoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await categoryRepository.fetchCategories();
  }
}
