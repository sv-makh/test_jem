import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/screens/dish_dialog_screen.dart';

class DishesItem extends StatelessWidget {
  const DishesItem({super.key, required this.dish, required this.width, required this.height});

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
        padding: EdgeInsets.all(4),
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                color: Color(0xffF8F7F5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              child: Image.network(dish.image_url),
            ),
            Row(
              children: [
                SizedBox(
                  width: width,
                    child: Text(dish.name, style: TextStyle(fontSize: 14))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
