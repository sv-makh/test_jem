part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesLoading extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends CategoriesState {
  const CategoriesLoaded(this.categories);

  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}

class CategoriesError extends CategoriesState {
  @override
  List<Object> get props => [];
}