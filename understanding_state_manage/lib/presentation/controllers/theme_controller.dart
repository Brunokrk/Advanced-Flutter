import 'package:flutter/material.dart';
//Change Notifier é um mixin que implementa o Listenable 

class ThemeController  extends ChangeNotifier{
  bool isDarkTheme = false;

  void toggleTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();//todo mundo que estiver escutando este changeNotifier será atualizado neste ponto
  }
}