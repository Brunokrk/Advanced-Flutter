import 'package:understanding_state_manage/contracts/observable_state.dart';
import 'package:understanding_state_manage/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState{


  final T _state;

  @override
  T get state => _state;

  set state( T newState){

  }

  StateObservable(this._state);


}