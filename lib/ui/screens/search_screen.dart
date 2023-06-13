import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

//заглушка для экрана Поиск
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(),
    );
  }
}
