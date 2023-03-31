import 'package:ecom_clean_code/features/cart/domain/usecase/add_to_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'add_to_cart_state.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCart addToCartUsecase;
  AddToCartCubit(this.addToCartUsecase)
      : super(
          AddToCartInitial(),
        );

  void addToCart(Product product) async {
    emit(
      AddToCartLoading(),
    );
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    final response = await addToCartUsecase.call(
      CartParams(product),
    );
    response.fold((failure) {
      emit(
        AddToCartFailed(failure.failureMessage),
      );
    }, (success) {
      emit(
        AddToCartSuccess(),
      );
    });
  }
}
