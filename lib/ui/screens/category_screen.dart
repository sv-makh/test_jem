import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final int index;

  CategoryScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category screen'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
