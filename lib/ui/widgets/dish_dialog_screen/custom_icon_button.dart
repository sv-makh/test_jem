import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onTap;

  const CustomIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double size = 40;

    return InkWell(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: icon,
      ),
      onTap: onTap,
    );
  }
}
