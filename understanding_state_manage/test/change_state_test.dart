import 'package:flutter_test/flutter_test.dart';
import 'package:understanding_state_manage/controllers/change_state.dart';


void main(){

  //Padrão de testes AAA
  group("Should test ChangeState", (){
    test("Should increment counter", (){
      //Arrange
      final _CounterChangeState changeState = _CounterChangeState();

      //Act
      changeState.increment();

      //Assert
      expect(changeState.counter, 1);
    });

     test("Should execute callback", (){
      //Arrange
      bool callbackChanged = false;
      final _CounterChangeState changeState = _CounterChangeState();

      //Act
      changeState.addListener((){
        callbackChanged = true;
      });
      changeState.increment();

      //Assert
      expect(changeState.counter, 1);
      expect(callbackChanged, true);
    });

  });

}

class _CounterChangeState extends ChangeState{
  int counter = 0;

  void increment(){
    counter ++;
    notifyCallbacks();
  }

}