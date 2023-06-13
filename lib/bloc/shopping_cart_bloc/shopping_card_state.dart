part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartState extends Equatable {
  const ShoppingCartState();
}

class ShoppingCartLoading extends ShoppingCartState {
  @override
  List<Object> get props => [];
}

class ShoppingCartLoaded extends ShoppingCartState {
  final ShoppingCart cart;

  const ShoppingCartLoaded({this.cart = const ShoppingCart()});

  @override
  List<Object> get props => [cart];
}

class ShoppingCartError extends ShoppingCartState {
  @override
  List<Object> get props => [];
}
