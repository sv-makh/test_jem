import 'package:flutter/material.dart';
import 'package:test_jem/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:test_jem/ui/widgets/tab_navigator.dart';

//чтобы навигация на вкладках осуществлялась независимо
//и BottomNavigationBar всегда оставалась на экране,
//на каждой вкладке создаётся свой навигатор (со своим ключом GlobalKey)

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //индекс текущей открытой вкладки (первоначально экран Главный)
  int _selectedIndex = 0;

  //ключи для навигаторов вкладок
  final _navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  //переход по вкладкам
  void _onItemTapped(int tabIndex) {
    if (tabIndex == _selectedIndex) {
      //переход на первый путь
      _navigatorKeys[tabIndex]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = tabIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //при использовании кнопки назад выход из приложения
      //только если находимся на первом экране любой вкладки
      //(некуда больше переходить)
      onWillPop: () async =>
          !await _navigatorKeys[_selectedIndex]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  //создание навигатора с ключом _navigatorKeys[tabIndex] для вкладки tabIndex
  Widget _buildOffstageNavigator(int tabIndex) {
    return Offstage(
      offstage: _selectedIndex != tabIndex,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabIndex]!,
        tabIndex: tabIndex,
      ),
    );
  }
}
