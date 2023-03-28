import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_cubit_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProductsUsecase;
  ProductCubit(this.getProductsUsecase)
      : super(
          ProductInitial(),
        );

  void fetchProductsList(String category) async {
    emit(ProductLoading());

    final response = await getProductsUsecase.call(
      GetProductsParams(category: category),
    );
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
