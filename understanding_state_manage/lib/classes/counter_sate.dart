import 'package:understanding_state_manage/controllers/change_state.dart';

class CounterState extends ChangeState{ 
  int counter = 0;

  void increment(){
    counter ++;
    notifyCallbacks();
  }
}