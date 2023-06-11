class Category {
  int index;
  String name;
  String imageUrl;

  Category({
    required this.index,
    required this.name,
    required this.imageUrl,
  });

  Category.fromMap(Map<String, dynamic> data)
      : index = data['id'],
        name = data['name'],
        imageUrl = data['image_url'];
}
