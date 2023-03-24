import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchProducts(String category);
}
