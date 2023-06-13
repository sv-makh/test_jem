import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/categories_bloc/categories_bloc.dart';
import 'package:test_jem/ui/widgets/error_screen_widget.dart';
import '../widgets/categories_screen/categories_item.dart';
import '../helpers/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/loading_screen_widget.dart';

class CategoriesScreen extends StatelessWidget {
  final ValueChanged<String>? onPush;

  const CategoriesScreen({super.key, this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const LoadingScreenWidget();
          } else if (state is CategoriesLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: sidePadding,
                  right: sidePadding,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoriesItem(
                      category: state.categories[index],
                      onPush: onPush,
                    );
                  },
                  itemCount: state.categories.length,
                ),
              ),
            );
          } else {
            //CategoriesError()
            return const ErrorScreenWidget();
          }
        },
      ),
    );
  }
}
