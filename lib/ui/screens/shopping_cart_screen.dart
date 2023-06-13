import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_jem/bloc/shopping_cart_bloc/shopping_cart_bloc.dart';
import 'package:test_jem/ui/widgets/custom_text_button.dart';
import 'package:test_jem/ui/widgets/loading_screen_widget.dart';
import '../../data/models/dish.dart';
import '../helpers/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/error_screen_widget.dart';
import '../widgets/shopping_cart_screen/cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          if (state is ShoppingCartLoading) {
            return const LoadingScreenWidget();
          } else if (state is ShoppingCartLoaded) {
            return Padding(
              padding: const EdgeInsets.only(
                left: sidePadding,
                right: sidePadding,
                bottom: sidePadding,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        Dish currentDish = state.cart.uniqueDishes[index];
                        return CartItem(
                          dish: currentDish,
                          count: state.cart.countOfDish(currentDish),
                        );
                      },
                      itemCount: state.cart.uniqueDishes.length,
                      shrinkWrap: true,
                    ),
                  ),
                  //const Spacer(),
                  CustomTextButton(
                    text: 'Оплатить ${state.cart.totalPrice} ₽',
                    onPressed: () {},
                  ),
                ],
              ),
            );
          } else {
            //ShoppingCartError()
            return const ErrorScreenWidget();
          }
        },
      ),
    );
  }
}
