import 'package:flutter/material.dart';
import 'package:understanding_state_manage/classes/counter_sate.dart';
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

  @override
  void initState() {
    counterState.addListener(callback);
    super.initState();
  }
  @override
  void dispose() {

    counterState.removeListener(callback);
    super.dispose();
  }

  void callback(){
    setState(() {
      
    });
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
          Text("Valor do estado: ${counterState.counter}"),
          ElevatedButton(onPressed: () {
            print("TESTEEEEEE");
            counterState.increment();
            }, child: const Text("Incrementar"))
        ],
      )),
    );
  }
}
