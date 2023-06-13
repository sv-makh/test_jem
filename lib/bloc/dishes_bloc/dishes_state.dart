part of 'dishes_bloc.dart';

abstract class DishesState extends Equatable {
  const DishesState();
}

class DishesLoading extends DishesState {
  @override
  List<Object> get props => [];
}

class DishesLoaded extends DishesState {
  const DishesLoaded(this.dishes, this.allDishes, this.tags, this.activeTag);

  //блюда для отображения
  final List<Dish> dishes;

  //все блюда категории
  final List<Dish> allDishes;

  //все теги всех блюд
  final List<String> tags;

  //активный в данный момент тег
  final String activeTag;

  @override
  List<Object> get props => [dishes, allDishes, tags, activeTag];
}

class DishesError extends DishesState {
  @override
  List<Object> get props => [];
}
