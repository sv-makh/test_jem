import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/shopping_cart_bloc/shopping_cart_bloc.dart';
import 'package:test_jem/data/models/dish.dart';
import 'package:test_jem/ui/helpers/constants.dart';
import 'package:test_jem/ui/helpers/custom_icons_icons.dart';
import 'package:test_jem/ui/widgets/custom_text_button.dart';
import 'package:test_jem/ui/widgets/dish_dialog_screen/spacer_box.dart';
import 'package:test_jem/ui/widgets/dish_image.dart';
import 'package:test_jem/ui/widgets/dish_metrics.dart';

import '../widgets/dish_dialog_screen/custom_icon_button.dart';

//карточка блюда, появляющаяся поверх экрана с блюдами
class DishDialogScreen extends StatelessWidget {
  final Dish dish;

  const DishDialogScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    //размеры подобраны экспериментально для лучшего вида
    double imageHeight = MediaQuery.of(context).size.width / 2 + 50;
    double imageWidth = MediaQuery.of(context).size.width - 2 * sidePadding;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              DishImage(
                width: imageWidth,
                height: imageHeight,
                imageUrl: dish.image_url,
              ),
              Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    children: [
                      CustomIconButton(
                        icon: const Icon(CustomIcons.heart),
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      CustomIconButton(
                          icon: const Icon(Icons.close),
                          onTap: () {
                            Navigator.pop(context);
                          })
                    ],
                  )),
            ]),
            const SpacerBox(),
            Text(
              dish.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SpacerBox(),
            DishMetrics(dish: dish),
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
              onPressed: () {
                BlocProvider.of<ShoppingCartBloc>(context)
                    .add(ShoppingCartDishAdded(dish));
              },
            ),
          ],
        ),
      ),
    );
  }
}
