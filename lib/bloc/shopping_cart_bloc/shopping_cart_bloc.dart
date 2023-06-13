import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_jem/data/models/shopping_cart.dart';
import 'package:test_jem/data/repositories/shopping_cart_repository.dart';

import '../../data/models/dish.dart';

part 'shopping_cart_event.dart';

part 'shopping_card_state.dart';

//блок для управления корзиной ShoppingCartScreen
class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc({required this.shoppingCartRepository})
      : super(ShoppingCartLoading()) {
    on<ShoppingCartStarted>(_onStarted);
    on<ShoppingCartDishAdded>(_onDishAdded);
    on<ShoppingCartDishRemoved>(_onDishRemoved);
  }

  final ShoppingCartRepository shoppingCartRepository;

  void _onStarted(
      ShoppingCartStarted event, Emitter<ShoppingCartState> emitter) {
    emitter(ShoppingCartLoading());

    try {
      final dishes = shoppingCartRepository.loadShoppingCart();
      emitter(ShoppingCartLoaded(cart: ShoppingCart(dishes: [...dishes])));
    } catch (_) {
      emitter(ShoppingCartError());
    }
  }

  void _onDishAdded(
      ShoppingCartDishAdded event, Emitter<ShoppingCartState> emitter) {
    final state = this.state;
    if (state is ShoppingCartLoaded) {
      try {
        shoppingCartRepository.addDishToShoppingCart(event.dish);
        emitter(ShoppingCartLoaded(
            cart: ShoppingCart(dishes: [...state.cart.dishes, event.dish])));
      } catch (_) {
        emitter(ShoppingCartError());
      }
    }
  }

  void _onDishRemoved(
      ShoppingCartDishRemoved event, Emitter<ShoppingCartState> emitter) {
    final state = this.state;
    if (state is ShoppingCartLoaded) {
      try {
        shoppingCartRepository.removeDishFromCart(event.dish);
        emitter(ShoppingCartLoaded(
            cart: ShoppingCart(
                dishes: [...state.cart.dishes]..remove(event.dish))));
      } catch (_) {
        emitter(ShoppingCartError());
      }
    }
  }
}
