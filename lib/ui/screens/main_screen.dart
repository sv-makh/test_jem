import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  final ValueChanged<int>? onPush;

  const MainScreen({super.key, this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () => onPush?.call(0),
            child: Text('to the category screen'),
          ),
        ],
      ),
    );
  }
}
