import 'package:dio/dio.dart';
import 'package:test_jem/data/api_client/api_client.dart';
import 'package:test_jem/data/models/response_data_dishes.dart';

import '../models/category.dart';
import '../models/dish.dart';
import '../models/response_data_categories.dart';

class ApiDataRepository {
  final _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  Future<List<Category>> loadCategories() async {
    ResponseDataCategories responseDataCategories =
        await _client.getCategories();
    return responseDataCategories.categories
        .map((data) => Category.fromMap(data))
        .toList();
  }

  Future<List<Dish>> loadDishes() async {
    ResponseDataDishes responseDataDishes = await _client.getDishes();
    print('loadDishes happening!');
    print(responseDataDishes.dishes.length);
    for (var d in responseDataDishes.dishes) {print(d['tegs']);}
    List<Dish> result = responseDataDishes.dishes.map((data) => Dish.fromMap(data)).toList();
    for (var d in result) {print('twice ${d.index}');}
    return result;
    //return responseDataDishes.dishes.map((data) => Dish.fromMap(data)).toList();
  }
}
