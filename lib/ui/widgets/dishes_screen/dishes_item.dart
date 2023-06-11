import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/screens/dish_dialog_screen.dart';

class DishesItem extends StatelessWidget {
  const DishesItem({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DishDialogScreen(dish: dish),
        );
      }, //=> onPush?.call(dish),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(dish.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(dish.name, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
