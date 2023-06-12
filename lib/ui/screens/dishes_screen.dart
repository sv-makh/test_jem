import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:test_jem/ui/widgets/constants.dart';

import '../../data/models/dish.dart';
import '../widgets/dishes_screen/dishes_item.dart';

class DishesScreen extends StatelessWidget {
  final String categoryName;

  DishesScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    int numOfColumns = 3;
    double itemWidth =
        MediaQuery.of(context).size.width / numOfColumns - sidePadding * 2;
    double itemHeight = itemWidth + 50;

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
            return Padding(
              padding: const EdgeInsets.only(left: sidePadding, right: sidePadding),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numOfColumns,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemCount: state.dishes.length,
                itemBuilder: (context, index) {
                  return DishesItem(
                    dish: state.dishes[index],
                    width: itemWidth,
                    height: itemHeight,
                  );
                },
              ),
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
