import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/categories_bloc/categories_bloc.dart';
import 'package:test_jem/data/repositories/api_data_repository.dart';
import 'package:test_jem/ui/screens/app.dart';

void main() {
  runApp(MyApp(
    categoriesRepository: ApiDataRepository(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.categoriesRepository});

  final ApiDataRepository categoriesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CategoriesBloc(apiDataRepository: categoriesRepository)
                ..add(CategoriesStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Тестовое',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: App(),
      ),
    );
  }
}
