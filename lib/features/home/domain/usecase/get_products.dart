import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// @LazySingleton()
class GetProducts extends Usecase<List<Product>, GetProductsParams> {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> call(GetProductsParams params) async {
    return await productRepository.fetchProducts(params.category);
  }
}

class GetProductsParams extends Equatable {
  final String category;

  const GetProductsParams({required this.category});

  @override
  List<Object?> get props => [category];
}
