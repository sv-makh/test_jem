part of 'dishes_bloc.dart';

abstract class DishesEvent extends Equatable {
  const DishesEvent();
}

class DishesStarted extends DishesEvent {
  @override
  List<Object> get props => [];
}