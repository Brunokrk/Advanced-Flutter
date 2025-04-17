import 'package:flutter/material.dart';
import 'package:understanding_state_manage/builders/observable_builder.dart';
import 'package:understanding_state_manage/builders/observable_state_builder.dart';
import 'package:understanding_state_manage/classes/counter_sate.dart';
import 'package:understanding_state_manage/contracts/observable.dart';
import 'package:understanding_state_manage/controllers/state_observable.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  final counterState = CounterState();
  final observableCounter = StateObservable(0);

  void callback() {
    setState(() {});
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
          ObservableStateBuilder(
              stateObservable: observableCounter,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Valor do counter: $state"),),);
              },
              buildWhen: (oldState, newState) => newState % 2 == 0,
              builder: (context, state, child) {
                return Text("Valor do counterState: $state");
              }),
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
