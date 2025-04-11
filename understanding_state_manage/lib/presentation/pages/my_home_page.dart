
import 'package:flutter/material.dart';
import 'package:understanding_state_manage/main.dart';
import 'package:understanding_state_manage/presentation/controllers/theme_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //coluna com eixo principal alinhado ao centro
          children: [
            Text("Trocar tema do Aplicativo"),
            ValueListenableBuilder(
              valueListenable: themeController,
              builder: (context, value, child) {
                return Switch(
                  value: value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
