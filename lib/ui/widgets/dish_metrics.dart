import 'package:flutter/material.dart';

import '../../data/models/dish.dart';

//цена и вес блюда строкой
class DishMetrics extends StatelessWidget {
  final Dish dish;

  const DishMetrics({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${dish.price.toString()} ₽ ',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          '· ${dish.weight.toString()}г',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
