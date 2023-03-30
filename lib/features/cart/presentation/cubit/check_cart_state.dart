part of 'check_cart_cubit.dart';

abstract class CheckCartState extends Equatable {
  const CheckCartState();

  @override
  List<Object> get props => [];
}

class CheckCartInitial extends CheckCartState {}

class CheckCartLoading extends CheckCartState {}

class CheckCartLoaded extends CheckCartState {
  final bool isInCart;

  const CheckCartLoaded(this.isInCart);

  @override
  List<Object> get props => [isInCart];
}

class CheckCartFailed extends CheckCartState {
  final String errorMessage;

  const CheckCartFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
