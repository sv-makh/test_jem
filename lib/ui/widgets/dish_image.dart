import 'package:flutter/material.dart';

class DishImage extends StatelessWidget {
  const DishImage({super.key, required this.size, required this.imageUrl});

  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xffF8F7F5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.network(imageUrl),
    );
  }
}
