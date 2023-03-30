import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart';
import 'package:ecom_clean_code/features/home/data/mapper/product_domain_mapper.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ErrorHandler errorHandler;
  final ProductDomainMapper productDomainMapper;

  ProductRepositoryImpl(
      this.remoteDataSource, this.errorHandler, this.productDomainMapper);
  @override
  Future<Either<Failure, List<Product>>> fetchProducts(String category) async {
    final response = await remoteDataSource.getProducts(category);
    List<Product> productList = [];
    for (var product in response) {
      productList.add(
        productDomainMapper.fromProductModel(product),
      );
    }
    return await errorHandler.handleError<List<Product>>(productList);
  }
}
