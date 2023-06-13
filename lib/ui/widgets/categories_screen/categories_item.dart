import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dishes_bloc/dishes_bloc.dart';
import '../../../data/models/category.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key, required this.category, required this.onPush});

  final Category category;
  final ValueChanged<String>? onPush;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<DishesBloc>(context).add(DishesStarted());
        onPush?.call(category.name);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Container(
          height: 148,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(
                image: NetworkImage(category.image_url),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 16),
            child: Text(
              category.name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
