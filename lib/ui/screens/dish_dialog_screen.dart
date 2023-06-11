import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';

class DishDialogScreen extends StatelessWidget {
  final Dish dish;

  const DishDialogScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16.0),
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
            Row(
              children: [Text(dish.name, style: TextStyle(fontSize: 16))],
            ),
            Row(children: [
              Text(
                '${dish.price.toString()} ₽  ',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '${dish.weight.toString()}г',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ]),
            Text(
              dish.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.65),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3364E0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xff3364E0)),
                  ),
                ),
              ),
/*              style: TextButton.styleFrom(
                backgroundColor: Color(0xff3364E0),
              ),*/
              child: Container(
/*                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),*/
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Добавить в корзину',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
