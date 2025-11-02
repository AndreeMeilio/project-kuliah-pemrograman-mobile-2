import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_practice/data/models/jokes.dart';
import 'package:state_management_practice/data/repositories/jokes_repository.dart';
import 'package:state_management_practice/states/jokes_states.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(JokesStates.randomJokesValue);
          
          switch(data){
            case AsyncValue(:final value?):
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value.setup ?? "",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      value.punchline ?? "",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            case AsyncValue(error: != null):
              return Text('Error: ${data.error}');
            case AsyncValue():
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () => ref.invalidate(JokesStates.randomJokesValue),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      )
    );
  }
}
