import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/cart/domain/usecase/get_cart_list.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_cart_state.dart';

@injectable
class GetCartCubit extends Cubit<GetCartState> {
  final GetCartList usecase;
  GetCartCubit(this.usecase)
      : super(
          GetCartListInitial(),
        );

  void getCartList() async {
    emit(
      GetCartListLoading(),
    );

    final response = await usecase.call(
      NoParams(),
    );

    response.fold((failure) {
      emit(
        GetCartListFailed(failure.failureMessage),
      );
    }, (cartList) {
      emit(
        GetCartListLoaded(cartList),
      );
    });
  }
}
