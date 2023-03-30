import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/cart/data/datasource/cart_local_source.dart';
import 'package:ecom_clean_code/features/cart/domain/repository/cart_repository.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartLocalSource localSource;

  CartRepositoryImpl(this.localSource);

  @override
  Future<Either<Failure, bool>> addToCart(Product product) async {
    try {
      final result = await localSource.addToCart(product);
      return Right(result);
    } on CartException catch (e) {
      return Left(
        Failure(e.exceptionMessage),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isInCart(Product product) async {
    try {
      final result = await localSource.addToCart(product);
      return Right(result);
    } on CartException catch (e) {
      return Left(
        Failure(e.exceptionMessage),
      );
    }
  }
}
