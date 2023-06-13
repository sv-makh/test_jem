import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/category.dart';
import '../../data/repositories/api_data_repository.dart';

part 'categories_event.dart';

part 'categories_state.dart';

//блок для экрана категорий (главного) CategoriesScreen
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.apiDataRepository})
      : super(CategoriesLoading()) {
    on<CategoriesStarted>(_onStarted);
  }

  final ApiDataRepository apiDataRepository;

  Future<void> _onStarted(
    CategoriesStarted event,
    Emitter<CategoriesState> emitter,
  ) async {
    emitter(CategoriesLoading());
    try {
      final categories = await apiDataRepository.loadCategories();
      emitter(CategoriesLoaded(categories));
    } catch (_) {
      emitter(CategoriesError());
    }
  }
}
