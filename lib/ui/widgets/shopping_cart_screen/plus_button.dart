import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class PlusButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const PlusButton({super.key, required this.size, required this.onTap});

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
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
