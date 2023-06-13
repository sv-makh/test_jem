import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_jem/data/repositories/api_data_repository.dart';

import '../../data/models/dish.dart';

part 'dishes_event.dart';

part 'dishes_state.dart';

//тег для показа всех блюд
const String _allMenu = 'Все меню';

//блок для экрана блюд DishesScreen
class DishesBloc extends Bloc<DishesEvent, DishesState> {
  DishesBloc({required this.apiDataRepository}) : super(DishesLoading()) {
    on<DishesStarted>(_onStarted);
    on<DishesTagTapped>(_onTagTapped);
  }

  final ApiDataRepository apiDataRepository;

  //список всех блюд в категории
  late List<Dish> allDishes;

  //список всех тегов
  late List<String> tags;

  Future<void> _onStarted(
      DishesStarted event, Emitter<DishesState> emitter) async {
    emitter(DishesLoading());
    try {
      //скачивааются все блюда в категории
      allDishes = await apiDataRepository.loadDishes();
      //блюда, которые будут показаны на экране - вначале все
      List<Dish> dishes = [...allDishes];
      //получение тегов из всех блюд
      tags = _getTags(allDishes);
      String activeTag = '';
      //установка активного тега
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

  //при активации тега изменяется список показываемых блюд
  void _onTagTapped(DishesTagTapped event, Emitter<DishesState> emitter) {
    List<Dish> dishesWithTag = _pickDishes(allDishes, event.tag);
    emitter(DishesLoaded(dishesWithTag, allDishes, tags, event.tag));
  }

  //возвращаются блюда, отмеченные тегом tag
  List<Dish> _pickDishes(List<Dish> allDishes, String tag) {
    List<Dish> result = [];
    for (var dish in allDishes) {
      if (dish.tegs.contains(tag)) {
        result.add(dish);
      }
    }
    return result;
  }

  //получение неповторяющегося списка тегов из всех блюд
  List<String> _getTags(List<Dish> allDishes) {
    Set<String> tagSet = {};
    List<String> result = [];

    for (var dish in allDishes) {
      for (var tag in dish.tegs) {
        tagSet.add(tag);
      }
    }

    result = tagSet.toList();
    //установка тега "Все меню" первым
    if (tagSet.contains(_allMenu)) {
      result.remove(_allMenu);
      result.insert(0, _allMenu);
    }

    return result;
  }
}
