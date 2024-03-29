import 'package:test_jem/data/models/dish.dart';

//через этот репозиторий блок ShoppingCartBloc работает с корзиной
class ShoppingCartRepository {
  final _dishes = <Dish>[];

  List<Dish> loadShoppingCart() => _dishes;

  void addDishToShoppingCart(Dish dish) => _dishes.add(dish);

  void removeDishFromCart(Dish dish) => _dishes.remove(dish);
}
