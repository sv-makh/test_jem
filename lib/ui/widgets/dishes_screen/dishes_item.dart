import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/screens/dish_dialog_screen.dart';

import '../dish_image.dart';

class DishesItem extends StatelessWidget {
  const DishesItem({
    super.key,
    required this.dish,
    required this.width,
    required this.height,
  });

  final Dish dish;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DishDialogScreen(dish: dish),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DishImage(
              width: width,
              height: width,
              imageUrl: dish.image_url,
            ),
            SizedBox(
              width: width,
              child: Text(
                dish.name,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
