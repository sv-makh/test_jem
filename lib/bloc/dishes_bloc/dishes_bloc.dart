import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_jem/data/repositories/api_data_repository.dart';

import '../../data/models/dish.dart';

part 'dishes_event.dart';

part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  DishesBloc({required this.apiDataRepository}) : super(DishesLoading()) {
    on<DishesStarted>(_onStarted);
    on<DishesTagTapped>(_onTagTapped);
  }

  final ApiDataRepository apiDataRepository;
  late List<Dish> allDishes;
  late List<String> tags;

  Future<void> _onStarted(
      DishesStarted event, Emitter<DishesState> emitter) async {
    emitter(DishesLoading());
    try {
      allDishes = await apiDataRepository.loadDishes();
      List<Dish> dishes = [...allDishes];
      tags = _getTags(allDishes);
      String activeTag = '';
      if (tags.contains(_allMenu)) {
        activeTag = _allMenu;
      } else {
        activeTag = tags[0];
      }
      emitter(DishesLoaded(dishes, allDishes, tags, activeTag));
    } catch (_) {
      emitter(DishesError());
    }
  }

  void _onTagTapped(DishesTagTapped event, Emitter<DishesState> emitter) {
    List<Dish> dishesWithTag = _pickDishes(allDishes, event.tag);
    emitter(DishesLoaded(dishesWithTag, allDishes, tags, event.tag));
  }
}

const String _allMenu = 'Все меню';

List<Dish> _pickDishes(List<Dish> allDishes, String tag) {
  List<Dish> result = [];
  for (var dish in allDishes) {
    if (dish.tegs.contains(tag)) {
      result.add(dish);
    }
  }
  return result;
}

List<String> _getTags(List<Dish> allDishes) {
  Set<String> tagSet = {};
  List<String> result = [];

  for (var dish in allDishes) {
    for (var tag in dish.tegs) {
      tagSet.add(tag);
    }
  }

  result = tagSet.toList();
  if (tagSet.contains(_allMenu)) {
    result.remove(_allMenu);
    result.insert(0, _allMenu);
  }

  return result;
}
