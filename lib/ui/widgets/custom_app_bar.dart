import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    String city = 'Санкт-Петербург';

    final now = DateTime.now();
    String date = DateFormat('yMMMMd').format(now);

    return AppBar(
      title: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Column(
            children: [
              Text(city),
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}
