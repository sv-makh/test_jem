import 'package:flutter/material.dart';

import '../constants.dart';

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
        child: Text(text, style: TextStyle(fontSize: 14),),
      ),
    );
  }
}
