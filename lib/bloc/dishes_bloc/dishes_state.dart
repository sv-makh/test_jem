part of 'dishes_bloc.dart';

abstract class DishesState extends Equatable {
  const DishesState();
}

class DishesLoading extends DishesState {
  @override
  List<Object> get props => [];
}

class DishesLoaded extends DishesState {
  const DishesLoaded(this.dishes);

  final List<Dish> dishes;

  @override
  List<Object> get props => [dishes];
}

class DishesError extends DishesState {
  @override
  List<Object> get props => [];
}