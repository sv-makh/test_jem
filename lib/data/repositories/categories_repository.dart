import 'package:dio/dio.dart';
import 'package:test_jem/data/api_client/api_client.dart';

import '../models/category.dart';
import '../models/response_data_categories.dart';

class CategoriesRepository {
  final _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  Future<List<Category>> loadCategories() async {
    ResponseDataCategories responseDataCategories =
        await _client.getCategories();
    return responseDataCategories.categories
        .map((data) => Category.fromMap(data))
        .toList();
  }
}
