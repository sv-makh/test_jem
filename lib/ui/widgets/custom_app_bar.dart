import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:test_jem/ui/helpers/custom_icons_icons.dart';

import '../helpers/constants.dart';

//аппбар для главного экрана и корзины
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String date = '';

  @override
  void initState() {
    super.initState();
    initDateFormatting();
  }

  //необходимо для текущей даты в русской локали
  Future<void> initDateFormatting() async {
    await initializeDateFormatting('ru_RU', null).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    String city = 'Санкт-Петербург';

    final now = DateTime.now();
    String date = DateFormat.yMMMMd('ru_RU').format(now);

    return AppBar(
      title: Row(
        children: [
          const Icon(CustomIcons.location),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
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
