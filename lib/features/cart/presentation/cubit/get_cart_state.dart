part of 'get_cart_cubit.dart';

abstract class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object> get props => [];
}

class GetCartListInitial extends GetCartState {}

class GetCartListLoading extends GetCartState {}

class GetCartListLoaded extends GetCartState {
  final List<Product> cartList;

  const GetCartListLoaded(this.cartList);

  @override
  List<Object> get props => [cartList];
}

class GetCartListFailed extends GetCartState {
  final String errorMessage;

  const GetCartListFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
