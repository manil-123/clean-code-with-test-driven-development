import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProductsUsecase;
  ProductCubit(this.getProductsUsecase)
      : super(
          ProductInitial(),
        );

  void fetchProductsList() async {
    emit(ProductLoading());

    final response = await getProductsUsecase.call(NoParams());
    response.fold(
      (failure) {
        emit(
          ProductFailed(
            errorMessage: failure.failureMessage,
          ),
        );
      },
      (productsList) async {
        emit(
          ProductLoaded(productsList),
        );
      },
    );
  }
}
