import 'package:flutter/material.dart';

class DishImage extends StatelessWidget {
  const DishImage({super.key, required this.width, required this.height, required this.imageUrl});

  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double padding = height / 5;

    return Stack(children: [
      Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xffF8F7F5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Positioned(
        top: padding / 2,
        left: padding / 2 + (width - height) / 3,
        child: SizedBox(
          width: height - padding,
          height: height - padding,
          child: Image.network(imageUrl),
        ),
      ),
    ]);
  }
}
