import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

//заглушка для экрана Аккаунт
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(),
    );
  }
}