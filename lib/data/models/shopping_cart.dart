import 'package:equatable/equatable.dart';

import 'dish.dart';

//модель корзины
class ShoppingCart extends Equatable {
  const ShoppingCart({this.dishes = const <Dish>[]});

  //cсписок всех блюд в корзине
  //возможно повторяющийся, если добавлено более одного экземпляра блюда
  final List<Dish> dishes;

  //цена всего содержимого
  int get totalPrice {
    return dishes.fold(0, (total, current) => total + current.price);
  }

  //неповторяющийся список блюд в корзине
  List<Dish> get uniqueDishes {
    return [
      ...{...dishes}
    ];
  }

  //количество блюда dish в корзине
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
