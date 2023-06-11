import 'package:json_annotation/json_annotation.dart';

part 'response_data_categories.g.dart';

@JsonSerializable()
class ResponseDataCategories {
  List<dynamic> categories;

  ResponseDataCategories({required this.categories});

  factory ResponseDataCategories.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataCategoriesToJson(this);
}
