import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();
}
