// Implementar um observable e  gerenciar uma lista de callbacks e notificar quem esteja escutando

import 'package:understanding_state_manage/contracts/observable.dart';

class ChangeState implements Observable{
  
  //lista privada, somente esta classe pode manipular a lista de callbacks
  final List<void Function()> _callbacks = [];


  @override
  void addListener(void Function() callback) {
    if(!_callbacks.contains(callback)) _callbacks.add(callback);
    
  }

  @override
  void removeListener(void Function() callback) {
    if(_callbacks.contains(callback)) _callbacks.remove(callback);
  }

  //Necessário função que ao ser executada, execute TODOS os callbacks.
  void notifyCallbacks(){
    for (int i=0; i<_callbacks.length; i++){
      _callbacks[i](); // executa função na posição i da lista
    }
  }

}


