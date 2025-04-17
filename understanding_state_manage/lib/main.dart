import 'package:flutter/material.dart';
import 'package:understanding_state_manage/builders/observable_builder.dart';
import 'package:understanding_state_manage/builders/observable_state_builder.dart';
import 'package:understanding_state_manage/classes/counter_sate.dart';
import 'package:understanding_state_manage/contracts/observable.dart';
import 'package:understanding_state_manage/controllers/state_observable.dart';
import 'package:understanding_state_manage/mixins/change_state_mixin.dart';
// ctrl + K  -> ctrl + S

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ChangeStateMixin {
  final counterState = CounterState();
  final observableCounter = StateObservable(0);

  @override
  void initState() {
    useChangeState(counterState);
    useChangeState(observableCounter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de estado"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Valor do counterState: ${counterState.counter}"),
          ElevatedButton(
            onPressed: () {
              counterState.increment();
            },
            child: const Text('Increment'),
          ),
          Text("Valor do counterState: ${observableCounter.state}"),
          ElevatedButton(
            onPressed: () {
              observableCounter.state++;
            },
            child: const Text('Increment'),
          ),
        ],
      )),
    );
  }
}
