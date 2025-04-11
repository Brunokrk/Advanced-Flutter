import 'package:flutter/material.dart';
import 'package:understanding_state_manage/presentation/controllers/theme_controller.dart';

import 'presentation/pages/my_home_page.dart';

// ctrl + K  -> ctrl + S
///Trocar Tema da aplicação entre claro e escuro utilizando valueNotifier
///
void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value ? ThemeData.dark(): ThemeData.light(),
          home: MyHomePage(),
        );
      }
    );
  }
}
