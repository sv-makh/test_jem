import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/categories_bloc/categories_bloc.dart';
import 'package:test_jem/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:test_jem/data/repositories/api_data_repository.dart';
import 'package:test_jem/ui/screens/app.dart';

void main() {
  runApp(MyApp(
    apiDataRepository: ApiDataRepository(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.apiDataRepository});

  final ApiDataRepository apiDataRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoriesBloc(apiDataRepository: apiDataRepository)
            ..add(CategoriesStarted()),
        ),
        BlocProvider(
          create: (_) => DishesBloc(apiDataRepository: apiDataRepository)
            ..add(DishesStarted()),
        )
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
