import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/shopping_cart_bloc/shopping_cart_bloc.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/widgets/dish_image.dart';
import 'package:test_jem/ui/widgets/shopping_cart_screen/plus_button.dart';
import '../dish_metrics.dart';
import 'count_box.dart';
import 'minus_button.dart';

class CartItem extends StatelessWidget {
  final Dish dish;
  final int count;

  CartItem({super.key, required this.dish, required this.count});

  double height = 99; //80.0;
  double size = 32.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8), //, bottom: 8),
      height: height,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DishImage(width: height, height: height, imageUrl: dish.image_url),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 119, child: Text(dish.name, style: TextStyle(fontWeight: FontWeight.bold),)),
              DishMetrics(dish: dish),
            ],
          ),
          const Spacer(),
          MinusButton(
            size: size,
            onTap: () {
              BlocProvider.of<ShoppingCartBloc>(context)
                  .add(ShoppingCartDishRemoved(dish));
            },
          ),
          CountBox(size: size, text: count.toString()),
          PlusButton(
            size: size,
            onTap: () {
              BlocProvider.of<ShoppingCartBloc>(context)
                  .add(ShoppingCartDishAdded(dish));
            },
          ),
        ],
      ),
    );
  }
}
