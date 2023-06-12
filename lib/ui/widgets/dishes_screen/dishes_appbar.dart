import 'package:flutter/material.dart';

import '../constants.dart';

class DishesAppbar extends StatelessWidget  implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  const DishesAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      title: Row(
        children: [
          const Spacer(),
          Text(title),
          const Spacer(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ],
      ),
    );
  }
}
