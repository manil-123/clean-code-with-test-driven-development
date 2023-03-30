part of 'add_to_cart_cubit.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {}

class AddToCartFailed extends AddToCartState {
  final String errorMessage;

  const AddToCartFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
