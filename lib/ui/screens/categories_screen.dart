import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/categories_bloc/categories_bloc.dart';
import 'package:test_jem/data/models/response_data_categories.dart';
import 'package:test_jem/data/api_client/api_client.dart';
import '../../data/models/response_data_dishes.dart';
import '../widgets/categories_screen/categories_item.dart';
import '../widgets/constants.dart';
import '../widgets/custom_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  final ValueChanged<String>? onPush;

  const CategoriesScreen({super.key, this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
            return Center(
              child: Text('Что-то пошло не так'),
            );
          }
        },
      ),
    );
  }

/*      body: _buildBody(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () => onPush?.call(0),
              child: Text('to the category screen'),
            ),
            _buildBody(context),
          ],
        ),
      ),*/

/*  FutureBuilder<ResponseDataDishes> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseDataDishes>(
      future: client.getDishes(),
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.done) && snapshot.hasData ) {
            final ResponseDataDishes posts = snapshot.data!;
            return _buildListView(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, ResponseDataDishes posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              posts.dishes[index]['id'].toString(),
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(posts.dishes[index]['name']),
          ),
        );
      },
      itemCount: posts.dishes.length,
    );
  }*/
}
