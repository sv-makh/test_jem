import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class DishesAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  //необходимо для апп бара
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
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ],
      ),
    );
  }
}
