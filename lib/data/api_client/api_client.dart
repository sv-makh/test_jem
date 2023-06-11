import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import 'package:test_jem/data/models/response_data_categories.dart';
import 'package:test_jem/data/models/response_data_dishes.dart';
import '../apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.categoriesEndUrl)
  Future<ResponseDataCategories> getCategories();

  @GET(Apis.dishesEndUrl)
  Future<ResponseDataDishes> getDishes();
}