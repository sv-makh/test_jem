import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test_jem/data/models/response_data_categories.dart';

import 'package:test_jem/data/api_client/api_client.dart';
import '../../data/models/response_data_dishes.dart';
import '../widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  final ValueChanged<int>? onPush;

  const MainScreen({super.key, this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _buildBody(context),
/*      body: SingleChildScrollView(
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
    );
  }

/*  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder<ResponseData>(
        future: apiService.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
            final ResponseData posts = snapshot.data!;
            return _cats(context, posts); } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _cats(BuildContext context, ResponseData posts) {
    return ListView.builder(
      itemCount: posts.categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts.categories[index]['id'].toString()),
          subtitle: Text(posts.categories[index]['name'].toString()),
        );
      },
    );
  }*/

  FutureBuilder<ResponseDataDishes> _buildBody(BuildContext context) {
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
  }
}
