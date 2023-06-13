import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

//виджет с количеством данного блюда в корзине
class CountBox extends StatelessWidget {
  final String text;
  final double size;

  const CountBox({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: cartButtonsColor,
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 14),),
      ),
    );
  }
}
