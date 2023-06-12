import 'package:equatable/equatable.dart';

import 'dish.dart';

class ShoppingCart extends Equatable {
  const ShoppingCart({this.dishes = const <Dish>[]});

  final List<Dish> dishes;

  int get totalPrice {
    return dishes.fold(0, (total, current) => total + current.price);
  }

  List<Dish> get uniqueDishes {
    return [...{...dishes}];
  }

  int countOfDish(Dish dish) {
    int count = 0;
    for (var d in dishes) {
      if (d == dish) count++;
    }
    return count;
  }

  @override
  List<Object> get props => [dishes];
}