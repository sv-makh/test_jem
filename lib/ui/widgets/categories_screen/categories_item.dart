import 'package:flutter/material.dart';

import '../../../data/models/category.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key, required this.category, required this.onPush});

  final Category category;
  final ValueChanged<String>? onPush;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPush?.call(category.name),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Container(
          height: 148,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                image: NetworkImage(category.image_url),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 16),
            child: Text(
              category.name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
