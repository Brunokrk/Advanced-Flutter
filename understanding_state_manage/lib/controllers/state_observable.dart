import 'package:understanding_state_manage/contracts/observable_state.dart';
import 'package:understanding_state_manage/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState{
  T _state;

  @override 
  T get state => _state;

  set state(T newState){
    if(newState == _state) return;//aplicação possui um estado, e o novo emitido é igual ao anterior -> nada feito
    _state = newState;
    notifyCallbacks();
  }

  StateObservable(this._state);


}