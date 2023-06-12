import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/widgets/constants.dart';
import 'package:test_jem/ui/widgets/custom_text_button.dart';
import 'package:test_jem/ui/widgets/dish_dialog_screen/spacer_box.dart';

import '../widgets/dish_dialog_screen/custom_icon_button.dart';

class DishDialogScreen extends StatelessWidget {
  final Dish dish;

  const DishDialogScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    //размеры подобраны экспериментально для лучшего вида
    double imageSize = MediaQuery.of(context).size.width / 2;
    double additionSize = 50;

    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding:
          const EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Padding(
        padding: const EdgeInsets.all(sidePadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Container(
                //размеры подобраны экспериментально для лучшего вида
                width: double.infinity,
                height: imageSize + additionSize,
                decoration: BoxDecoration(
                  color: Color(0xffF8F7F5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Positioned(
                //размеры подобраны экспериментально для лучшего вида
                top: additionSize / 2,
                left: imageSize / 3,
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.network(dish.image_url),
                ),
              ),
              Positioned(
                top: 8,
                  right: 8,
                  child: Row(
                children: [
                  CustomIconButton(
                    icon: Icon(Icons.favorite_border),
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  CustomIconButton(
                      icon: Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context);
                      })
                ],
              )),
            ]),
            const SpacerBox(),
            Row(
              children: [
                Text(
                  dish.name,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SpacerBox(),
            Row(children: [
              Text(
                '${dish.price.toString()} ₽  ',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                '${dish.weight.toString()}г',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ]),
            const SpacerBox(),
            Text(
              dish.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.65),
              ),
            ),
            const SpacerBox(),
            CustomTextButton(
              text: 'Добавить в корзину',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
