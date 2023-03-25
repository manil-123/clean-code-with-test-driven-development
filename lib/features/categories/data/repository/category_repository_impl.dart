import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/features/categories/data/datasource/category_remote_data_source.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final ErrorHandler errorHandler;
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.errorHandler, this.remoteDataSource);
  @override
  Future<Either<Failure, List<Category>>> fetchCategories() async {
    return await errorHandler.handleError<List<Category>>(
      remoteDataSource.getCategoriesList(),
    );
  }
}
