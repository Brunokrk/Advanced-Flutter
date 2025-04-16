import 'package:flutter/material.dart';
import 'package:understanding_state_manage/contracts/observable.dart';

class ObservableBuilder extends StatefulWidget {
  final Observable observable; //quem escuta
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) builder; //widget recebido
  const ObservableBuilder(
      {super.key,
      required this.observable,
      required this.builder,
      this.child});

  @override
  State<ObservableBuilder> createState() => _ObservableBuilderState();
}

class _ObservableBuilderState extends State<ObservableBuilder> {
  @override
  void initState() {
    widget.observable.addListener(rebuild);
    super.initState();
  }

  @override
  void dispose() {
    widget.observable.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}
