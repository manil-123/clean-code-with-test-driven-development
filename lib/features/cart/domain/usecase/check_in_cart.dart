import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/cart/domain/repository/cart_repository.dart';
import 'package:ecom_clean_code/features/cart/domain/usecase/add_to_cart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CheckInCart extends Usecase<bool, CartParams> {
  final CartRepository cartRepository;

  CheckInCart(this.cartRepository);
  @override
  Future<Either<Failure, bool>> call(CartParams params) async {
    return await cartRepository.isInCart(params.product);
  }
}
