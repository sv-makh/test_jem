import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish {
  int id;
  String name;
  int price;
  int weight;
  String description;
  String image_url;
  List<String> tegs;

  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.image_url,
    required this.tegs,
  });

  factory Dish.fromJson(Map<String, dynamic> json) =>
      _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);
}
