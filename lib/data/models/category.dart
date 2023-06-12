import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final int id;
  final String name;
  final String image_url;

  Category({
    required this.id,
    required this.name,
    required this.image_url,
  });

  @override
  List<Object> get props => [id, name, image_url];

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
