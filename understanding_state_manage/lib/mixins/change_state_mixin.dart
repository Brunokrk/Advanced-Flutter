import 'package:flutter/material.dart';
import 'package:understanding_state_manage/controllers/change_state.dart';

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {

  //on -> somente classes que estendem State podem utilizar o mixin

  final List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState){
    changeState.addListener(_callback);
    _changeStates.add(changeState);
  }

  void _callback(){
    if(mounted){
      setState((){});
    }
  }

  @override
  void dispose() {
    for(ChangeState changeState in _changeStates){
      changeState.removeListener(_callback);
    }
    super.dispose();
  }

}