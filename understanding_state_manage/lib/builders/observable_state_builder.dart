import 'package:flutter/material.dart';
import 'package:understanding_state_manage/controllers/state_observable.dart';

class ObservableStateBuilder<T> extends StatefulWidget {
  const ObservableStateBuilder({super.key, required this.stateObservable, required this.builder, this.child, this.buildWhen, this.listener});

  final Widget Function(BuildContext context, T state, Widget? child) builder;
  final StateObservable<T> stateObservable;
  final Widget? child;
  final bool Function(T oldState, T newState)? buildWhen; // Se for passada, será executa e caso caia em True será rebuildada
  final void Function(BuildContext context, T state)? listener; // somente quando should rebuild

  @override
  State<ObservableStateBuilder<T>> createState() => _ObservableStateBuilderState<T>();
}

class _ObservableStateBuilderState<T> extends State<ObservableStateBuilder<T>> {
  
  late T state;

  @override
  void initState() {
    widget.stateObservable.addListener(callback);
    state = widget.stateObservable.state;
    super.initState();
  }

  void callback(){
    if(shouldRebuild()){
      state = widget.stateObservable.state;
      if(widget.listener != null){
        widget.listener!(context, state);
      }
      setState(() {});
    }else{
      state = widget.stateObservable.state;
    }
  }

  bool shouldRebuild(){
    if(widget.buildWhen != null){
      return widget.buildWhen!(state, widget.stateObservable.state);
    }
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, state, widget.child);
  
  }

  @override
  void dispose() {
    widget.stateObservable.removeListener(callback);
    super.dispose();
  }
}

