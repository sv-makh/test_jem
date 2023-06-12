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

  final List<Dish> dishes;
  final List<Dish> allDishes;
  final List<String> tags;
  final String activeTag;

  @override
  List<Object> get props => [dishes, allDishes, tags, activeTag];
}

class DishesError extends DishesState {
  @override
  List<Object> get props => [];
}