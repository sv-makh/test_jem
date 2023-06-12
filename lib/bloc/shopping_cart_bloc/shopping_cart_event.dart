part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}

class ShoppingCartStarted extends ShoppingCartEvent {
  @override
  List<Object> get props => [];
}

class ShoppingCartDishAdded extends ShoppingCartEvent {
  final Dish dish;

  const ShoppingCartDishAdded(this.dish);

  @override
  List<Object> get props => [dish];
}

class ShoppingCartDishRemoved extends ShoppingCartEvent {
  final Dish dish;

  const ShoppingCartDishRemoved(this.dish);

  @override
  List<Object> get props => [dish];
}