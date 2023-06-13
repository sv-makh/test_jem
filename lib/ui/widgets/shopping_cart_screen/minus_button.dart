import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class MinusButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const MinusButton({super.key, required this.size, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: cartButtonsColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
