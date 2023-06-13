import 'package:dio/dio.dart';
import 'package:test_jem/data/api_client/api_client.dart';
import 'package:test_jem/data/models/response_data_dishes.dart';

import '../models/category.dart';
import '../models/dish.dart';
import '../models/response_data_categories.dart';

//получение списков категорий и блюд для работы с ними через блок
class ApiDataRepository {
  final _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  Future<List<Category>> loadCategories() async {
    ResponseDataCategories responseDataCategories =
        await _client.getCategories();
    return responseDataCategories.categories
        .map((data) => Category.fromJson(data))
        .toList();
  }

  Future<List<Dish>> loadDishes() async {
    ResponseDataDishes responseDataDishes = await _client.getDishes();
    return responseDataDishes.dishes
        .map((data) => Dish.fromJson(data))
        .toList();
  }
}
