import 'package:flutter/material.dart';

import '../../data/models/dish.dart';

class DishMetrics extends StatelessWidget {
  final Dish dish;

  const DishMetrics({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${dish.price.toString()} ₽ ',
          style: const TextStyle(fontSize: 14),
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