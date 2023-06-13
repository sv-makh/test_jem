import 'package:flutter/material.dart';
import 'package:test_jem/ui/screens/account_screen.dart';
import 'package:test_jem/ui/screens/dishes_screen.dart';
import 'package:test_jem/ui/screens/categories_screen.dart';
import 'package:test_jem/ui/screens/search_screen.dart';
import 'package:test_jem/ui/screens/shopping_cart_screen.dart';

//класс с именами путей для вкладки Главная
class TabNavigatorRoutesMain {
  static const String root = '/';
  static const String category = '/category';
}

//класс с именами путей для вкладки Поиск
class TabNavigatorRoutesSearch {
  static const String root = '/';
}

//класс с именами путей для вкладки Корзина
class TabNavigatorRoutesShoppingCart {
  static const String root = '/';
}

//класс с именами путей для вкладки Аккаунт
class TabNavigatorRoutesAccount {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  //ключ навигатора
  final GlobalKey<NavigatorState> navigatorKey;

  //индекс вкладки, на которой находится навигатор
  final int tabIndex;

  const TabNavigator({required this.navigatorKey, required this.tabIndex});

  //функция перехода с вкладки Главная в категорию
  void _pushCategory(BuildContext context, {String catName = ''}) {
    var routeBuilders = _routeBuildersMain(context, catName: catName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutesMain.category]!(context),
      ),
    );
  }

  //экраны для путей вкладки Главная
  Map<String, WidgetBuilder> _routeBuildersMain(BuildContext context,
      {String catName = ''}) {
    return {
      TabNavigatorRoutesMain.root: (context) => CategoriesScreen(
            onPush: (catName) => _pushCategory(context, catName: catName),
          ),
      TabNavigatorRoutesMain.category: (context) => DishesScreen(categoryName: catName,),
    };
  }

  //экраны для путей вкладки Поиск
  Map<String, WidgetBuilder> _routeBuildersSearch(BuildContext context) {
    return {
      TabNavigatorRoutesSearch.root: (context) => const SearchScreen(),
    };
  }

  //экраны для путей вкладки Корзина
  Map<String, WidgetBuilder> _routeBuildersShoppingCart(BuildContext context) {
    return {
      TabNavigatorRoutesShoppingCart.root: (context) => const ShoppingCartScreen(),
    };
  }

  //экраны для путей вкладки Аккаунт
  Map<String, WidgetBuilder> _routeBuildersAccount(BuildContext context) {
    return {
      TabNavigatorRoutesAccount.root: (context) => const AccountScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = [
      _routeBuildersMain(context),
      _routeBuildersSearch(context),
      _routeBuildersShoppingCart(context),
      _routeBuildersAccount(context),
    ];

    final tabNavigatorRoutes = [
      TabNavigatorRoutesMain.root,
      TabNavigatorRoutesSearch.root,
      TabNavigatorRoutesShoppingCart.root,
      TabNavigatorRoutesAccount.root,
    ];

    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoutes[tabIndex],
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) =>
              routeBuilders[tabIndex][routeSettings.name]!(context),
        );
      },
    );
  }
}
