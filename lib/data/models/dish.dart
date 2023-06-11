class Dish {
  int index;
  String name;
  int price;
  int weight;
  String description;
  String imageUrl;
  List<String> tegs;

  Dish({
    required this.index,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tegs,
  });

  Dish.fromMap(Map<String, dynamic> data)
      : index = data['id'],
        name = data['name'],
        price = data['price'],
        weight = data['weight'],
        description = data['description'],
        imageUrl = data['image_url'],
        tegs = ['mock teg'];//data['tegs'];
}
