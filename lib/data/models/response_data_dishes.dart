import 'package:json_annotation/json_annotation.dart';

part 'response_data_dishes.g.dart';

@JsonSerializable()
class ResponseDataDishes {
  List<dynamic> dishes;

  ResponseDataDishes({required this.dishes});

  factory ResponseDataDishes.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataDishesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataDishesToJson(this);
}
