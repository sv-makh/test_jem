import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/dishes_bloc/dishes_bloc.dart';

import '../../data/models/dish.dart';
import '../widgets/dishes_screen/dishes_item.dart';

class DishesScreen extends StatelessWidget {
  final String categoryName;

  DishesScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocBuilder<DishesBloc, DishesState>(
        builder: (context, state) {
          if (state is DishesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DishesLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.dishes.length,
              itemBuilder: (context, index) {
                return DishesItem(
                  dish: state.dishes[index],
                );
              },
            );
          } else {
            //DishesError()
            return Center(
              child: Text('Что-то пошло не так'),
            );
          }
        },
      ),
    );
  }
}
