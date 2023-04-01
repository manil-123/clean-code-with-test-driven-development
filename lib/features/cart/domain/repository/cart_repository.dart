import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, bool>> addToCart(Product product);

  Future<Either<Failure, bool>> isInCart(Product product);

  Future<Either<Failure, List<Product>>> getProductsList();
}
