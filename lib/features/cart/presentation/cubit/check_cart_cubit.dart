import 'package:ecom_clean_code/app/database/cart_dao.dart';
import 'package:ecom_clean_code/features/cart/domain/usecase/add_to_cart.dart';
import 'package:ecom_clean_code/features/cart/domain/usecase/check_in_cart.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'check_cart_state.dart';

@injectable
class CheckCartCubit extends Cubit<CheckCartState> {
  final CheckInCart usecase;
  CheckCartCubit(this.usecase)
      : super(
          CheckCartInitial(),
        );

  void checkInCart(Product product) async {
    emit(
      CheckCartLoading(),
    );
    final response = await usecase.call(
      CartParams(product),
    );
    response.fold((failure) {
      emit(
        CheckCartFailed(failure.failureMessage),
      );
    }, (result) {
      emit(
        CheckCartLoaded(result),
      );
    });
  }
}
