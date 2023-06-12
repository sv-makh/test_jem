import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';

class CartItem extends StatelessWidget {
  final Dish dish;
  final int count;

  const CartItem({super.key, required this.dish, required this.count});

  final double height = 62.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Row(
        children: [
          Text(dish.name),
          const Spacer(),
          Text(count.toString()),
        ],
      ),
    );
  }
}
