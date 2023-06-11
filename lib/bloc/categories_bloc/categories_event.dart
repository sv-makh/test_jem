part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class CategoriesStarted extends CategoriesEvent {
  @override
  List<Object> get props => [];
}