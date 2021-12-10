import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class CounterBloc {
  StreamController<String> todoCompleteSink = StreamController();
  Stream<String> get todoCompleteStream => todoCompleteSink.stream;

  CounterBloc() {
    todoCompleteSink.add(Random().toString());
  }


  dispose() {
    todoCompleteSink.close();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CounterBloc bloc = CounterBloc();
  static int i=0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // here the bloc data is being consumed by the UI 
      stream: bloc.todoCompleteStream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo Home Page"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data ?? 0}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // here the sink is being used to tell
            // the bloc it should update it's state
            onPressed: () => bloc.todoCompleteSink.add("event"),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      }, 
    );
  }
}