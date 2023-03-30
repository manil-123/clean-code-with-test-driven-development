import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/cart/domain/repository/cart_repository.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddToCart extends Usecase<bool, CartParams> {
  final CartRepository cartRepository;

  AddToCart(this.cartRepository);
  @override
  Future<Either<Failure, bool>> call(CartParams params) async {
    return await cartRepository.addToCart(params.product);
  }
}

class CartParams extends Equatable {
  final Product product;

  const CartParams(this.product);

  @override
  List<Object?> get props => [product];
}
