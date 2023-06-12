part of 'dishes_bloc.dart';

abstract class DishesEvent extends Equatable {
  const DishesEvent();
}

class DishesStarted extends DishesEvent {
  @override
  List<Object> get props => [];
}

class DishesTagTapped extends DishesEvent {
  final String tag;

  const DishesTagTapped(this.tag);

  @override
  List<Object> get props => [tag];
}