import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart';

class GetProducts extends Usecase<List<Product>, NoParams> {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await productRepository.fetchProducts();
  }
}
