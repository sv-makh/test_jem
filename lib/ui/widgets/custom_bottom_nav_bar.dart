import 'package:flutter/material.dart';
import 'package:test_jem/ui/helpers/custom_icons_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.home),//Icon(Icons.home_filled),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.search),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.bag),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.profile),
          label: 'Аккаунт',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
