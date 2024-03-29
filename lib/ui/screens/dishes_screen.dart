import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:test_jem/ui/helpers/constants.dart';
import 'package:test_jem/ui/widgets/dishes_screen/dishes_appbar.dart';
import 'package:test_jem/ui/widgets/error_screen_widget.dart';
import '../widgets/dishes_screen/dishes_item.dart';
import '../widgets/dishes_screen/tag_button.dart';
import '../widgets/loading_screen_widget.dart';

//экран с блюдами
class DishesScreen extends StatelessWidget {
  final String categoryName;

  const DishesScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    //количество колонок в сетке
    int numOfColumns = 3;
    //ширина элемента сетки
    double itemWidth =
        MediaQuery.of(context).size.width / numOfColumns - sidePadding * 2;
    //высота элемента сетки
    double itemHeight = itemWidth + 50;

    return Scaffold(
      appBar: DishesAppbar(title: categoryName),
      body: BlocBuilder<DishesBloc, DishesState>(
        builder: (context, state) {
          if (state is DishesLoading) {
            return const LoadingScreenWidget();
          } else if (state is DishesLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: sidePadding, right: sidePadding),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TagButton(
                            text: state.tags[index],
                            activeTag: state.activeTag);
                      },
                      itemCount: state.tags.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
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
                  ),
                ],
              ),
            );
          } else {
            //DishesError()
            return const ErrorScreenWidget();
          }
        },
      ),
    );
  }
}
