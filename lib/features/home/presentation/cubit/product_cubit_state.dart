part of 'product_cubit_cubit.dart';

abstract class ProductCubitState extends Equatable {
  const ProductCubitState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductCubitState {}

class ProductLoading extends ProductCubitState {}

class ProductLoaded extends ProductCubitState {
  final List<Product> productsList;

  const ProductLoaded(this.productsList);
}

class ProductFailed extends ProductCubitState {
  final String errorMessage;
  const ProductFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
