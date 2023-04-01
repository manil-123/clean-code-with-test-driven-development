import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/cart/domain/repository/cart_repository.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCartList extends Usecase<List<Product>, NoParams> {
  final CartRepository cartRepository;

  GetCartList(this.cartRepository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await cartRepository.getProductsList();
  }
}
