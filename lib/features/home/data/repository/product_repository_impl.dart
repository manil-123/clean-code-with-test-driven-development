import 'dart:io';

import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

// @LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> fetchProducts(String category) async {
    try {
      final productsResponse = await remoteDataSource.getProducts(category);
      return Right(productsResponse);
    } on ServerException {
      return Left(Failure(ErrorMessage.serverFailureMessage));
    } on SocketException {
      return Left(Failure(ErrorMessage.socketExceptionMessage));
    }
  }
}
