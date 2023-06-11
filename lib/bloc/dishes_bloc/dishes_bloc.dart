import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_jem/data/repositories/api_data_repository.dart';

import '../../data/models/dish.dart';

part 'dishes_event.dart';

part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  DishesBloc({required this.apiDataRepository}) : super(DishesLoading()) {
    on<DishesStarted>(_onStarted);
  }

  final ApiDataRepository apiDataRepository;

  Future<void> _onStarted(
    DishesStarted event,
    Emitter<DishesState> emitter,
  ) async {
    emitter(DishesLoading());
    try {
      final dishes = await apiDataRepository.loadDishes();
      emitter(DishesLoaded(dishes));
    } catch (_) {
      emitter(DishesError());
    }
  }
}
