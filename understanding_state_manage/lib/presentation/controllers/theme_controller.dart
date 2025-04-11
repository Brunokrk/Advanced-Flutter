import 'package:flutter/material.dart';
//Change Notifier é um mixin que implementa o Listenable 

class ThemeController  extends ValueNotifier<bool>{
  ThemeController() : super(false); //value notifier começa como false

  void toggleTheme(){
    value =  !value;
    //Dentro do value notifier, o atributo value já implementa o notifyListeners, não sendo necessário chamá-lo.
  }
}