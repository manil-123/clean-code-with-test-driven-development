part of 'product_cubit_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> productsList;

  const ProductLoaded(this.productsList);
}

class ProductFailed extends ProductState {
  final String errorMessage;
  const ProductFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
